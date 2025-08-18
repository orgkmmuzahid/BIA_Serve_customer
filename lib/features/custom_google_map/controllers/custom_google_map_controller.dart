// File: custom_google_map_controller.dart

import 'dart:ui';

import 'package:bai_serve_customer/component/other_widgets/permission_handler_helper.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
// Get.lazyPut(() => CustomGoogleMapController(), fenix: true);

class CustomGoogleMapController extends GetxController {
  Set<Polyline> mapRoute = {};
  Set<Marker> markers = {};
  late GoogleMapController mapController;

  TravelMode _mode = TravelMode.driving;
  final String _mapKey = 'AIzaSyDk7p1Vl9WOtcDztagS6yPsgUYaVu_bCro';

  LatLng startLocation = const LatLng(23.772882, 90.420017);
  LatLng endLocation = const LatLng(23.772109, 90.419656);

  bool initialized = false;

  @override
  void onClose() {
    mapRoute.clear();
    markers.clear();
    initialized = false;
    super.onClose();
  }

  void onTravelModeChange(TravelMode mode) {
    _mode = mode;
    getPolylinePoints(startLocation, endLocation);
  }

  bool _isInitializing = false;
  void onMapCreated(GoogleMapController controller) async {
    if (_isInitializing) return;
    _isInitializing = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mapController = controller;
      update();
      _initMapAsync(); // See below
    });
  }

  Future<void> _initMapAsync() async {
    final isPermitted = await const PermissionHandlerHelper(permission: Permission.location).getStatus();

    if (!isPermitted || !Get.isRegistered<CustomGoogleMapController>()) return;

    try {
      final position = await Geolocator.getCurrentPosition();

      startLocation = LatLng(position.latitude, position.longitude);

      final startMarker = Marker(
        markerId: const MarkerId('start'),
        icon: await Utils.bitmapDescriptorFromIconData(Icons.gps_fixed_sharp, size: 30, color: Colors.blue),
        position: startLocation,
        infoWindow: const InfoWindow(title: 'Start'),
      );

      final endMarker = Marker(
        markerId: const MarkerId('end'),
        position: endLocation,
        icon: await Utils.bitmapDescriptorFromIconData(Icons.place, size: 30, color: Colors.blue),
        infoWindow: const InfoWindow(title: 'Destination'),
      );

      markers.addAll({startMarker, endMarker});

      try {
        await mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: startLocation, zoom: 18)),
        );
      } catch (_) {
        AppLogger.warning('Failed to animate camera');
      }

      await getPolylinePoints(startLocation, endLocation);

      update();
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map initialization failed');
    }
  }

  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    try {
      final polylinePoints = PolylinePoints();
      final List<LatLng> polylineCoordinates = [];
      mapRoute.clear();
      update();
      final result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: PointLatLng(start.latitude, start.longitude),
          destination: PointLatLng(end.latitude, end.longitude),
          mode: _mode,
        ),
        googleApiKey: _mapKey,
      );

      if (result.points.isNotEmpty) {
        polylineCoordinates.addAll(result.points.map((p) => LatLng(p.latitude, p.longitude)));

        _drawPolyline(polylineCoordinates);
        num distance = result.totalDistanceValue ?? 1 / 1000; // Convert to km
        num duration = result.totalDurationValue ?? 1 / 60; // Convert to minutes

        if (polylineCoordinates.isEmpty) return;

        // Place markers at start, middle, and end
        _addMarkers(
          start,
          end,
          polylineCoordinates[(polylineCoordinates.length / 2).toInt()],
          distance.toDouble(),
          duration.toDouble(),
        );

        print("Distance: ${distance} km  ${polylineCoordinates.length}");
        print("Duration: ${duration} minutes");
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map Polyline Error');
    }
  }

  void _drawPolyline(List<LatLng> points) {
    mapRoute.add(Polyline(polylineId: const PolylineId('route'), color: Colors.blue, width: 5, points: points));
    update();
    _moveCameraToFitPolyline(points);
  }

  void _moveCameraToFitPolyline(List<LatLng> polylinePoints) {
    if (polylinePoints.isNotEmpty) {
      // Calculate the bounds of the polyline points (bounding box)
      double minLat = polylinePoints[0].latitude;
      double maxLat = polylinePoints[0].latitude;
      double minLng = polylinePoints[0].longitude;
      double maxLng = polylinePoints[0].longitude;

      for (var point in polylinePoints) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLng) minLng = point.longitude;
        if (point.longitude > maxLng) maxLng = point.longitude;
      }
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng)),
          50,
        ),
      );
    }
  }

  void _addMarkers(LatLng start, LatLng end, LatLng middle, double distance, double duration) async {
    // Create custom markers with text
    // BitmapDescriptor startMarkerIcon = await _createCustomMarker(
    //   "Start\n${distance.toStringAsFixed(2)} km\n${duration.toStringAsFixed(2)} min",
    // );
    // BitmapDescriptor endMarkerIcon = await _createCustomMarker(
    //   "End\n${distance.toStringAsFixed(2)} km\n${duration.toStringAsFixed(2)} min",
    // );
    BitmapDescriptor middleMarkerIcon = await _createCustomMarker(
      "${distance.toStringAsFixed(2)} km\n${duration.toStringAsFixed(2)} min",
    );

    // Add markers with custom icons
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: start,
      icon: await const Icon(Icons.gps_fixed, color: Colors.blue).toBitmapDescriptor(),
    );

    final endMarker = Marker(markerId: MarkerId('end'), position: end);

    final middleMarker = Marker(markerId: MarkerId('middle'), position: middle, icon: middleMarkerIcon);

    // Add all markers to the map
    markers.addAll({startMarker, endMarker, middleMarker});
    update(); // Update the map to show the markers
  }
Future<BitmapDescriptor> _createCustomMarker(String text) async {
    return CommonText(
      text: text,
      backgroundColor: Colors.white,
      top: 5,
      right: 5,
      bottom: 5,
      left: 5,
      color: Colors.red,
      borderColor: AppColors.primaryColor2,
      borderRadious: 4.r,
    ).toBitmapDescriptor();
}



}
