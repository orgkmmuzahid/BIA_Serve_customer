// File: custom_google_map_controller.dart

import 'package:bai_serve_customer/component/other_widgets/permission_handler_helper.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
// Get.lazyPut(() => CustomGoogleMapController(), fenix: true);

class CustomGoogleMapController extends GetxController {
  Set<Polyline> mapRoute = {};
  Set<Marker> markers = {};
  late GoogleMapController mapController;

  TravelMode _mode = TravelMode.driving;
  final String _mapKey = 'AIzaSyAJrp3VvbO4E4jo7HRgqsk7EP8mPIZStxQ';

  LatLng startLocation = const LatLng(23.798440, 90.412663);
  LatLng endLocation = const LatLng(23.803544, 90.415371);

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
      if (!Get.isPrepared<CustomGoogleMapController>()) return;

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

      if (Get.isPrepared<CustomGoogleMapController>()) update();
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map initialization failed');
    }
  }

  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    startLocation = start;
    endLocation = end;

    try {
      final polylinePoints = PolylinePoints();
      final List<LatLng> polylineCoordinates = [];

      // Uncomment and provide valid key and route APIs if needed
      // final result = await polylinePoints.getRouteBetweenCoordinates(
      //   _mapKey,
      //   PointLatLng(start.latitude, start.longitude),
      //   PointLatLng(end.latitude, end.longitude),
      //   travelMode: _mode,
      // );

      // if (result.points.isNotEmpty) {
      //   polylineCoordinates.addAll(
      //     result.points.map((p) => LatLng(p.latitude, p.longitude)),
      //   );
      //   _drawPolyline(polylineCoordinates);
      // }

      // Simulated straight-line polyline for demo/testing
      polylineCoordinates.addAll([start, end]);
      _drawPolyline(polylineCoordinates);
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map Polyline Error');
    }
  }

  void _drawPolyline(List<LatLng> points) {
    mapRoute.clear();
    mapRoute.add(Polyline(polylineId: const PolylineId('route'), color: Colors.blue, width: 5, points: points));

    if (Get.isPrepared<CustomGoogleMapController>()) {
      update();
    }
  }
}
