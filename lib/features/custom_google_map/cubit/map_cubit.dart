import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'map_state.dart';

class MapCubit extends SafeCubit<MapState> {
  MapCubit() : super(MapState.initial());
  final String _mapKey = 'AIzaSyDk7p1Vl9WOtcDztagS6yPsgUYaVu_bCro';

  late GoogleMapController mapController;

  // This method is used for travel mode changes
  void onTravelModeChange(TravelMode mode) {
    emit(state.copyWith(travelMode: mode));
    getPolylinePoints(state.startLocation, state.endLocation);
  }

  // This method initializes the map and retrieves the current location
  Future<void> onMapCreated(GoogleMapController controller) async {
    // if (state.initializing) return;
    emit(state.copyWith(isLoading: true));

    mapController = controller;
    await _initMapAsync();
  }

  // Async initialization method
  Future<void> _initMapAsync() async {
    final isPermitted = await Permission.location.isGranted;

    if (!isPermitted) {
      emit(state.copyWith(initializing: false));
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition();
      final startLocation = LatLng(position.latitude, position.longitude);

      final startMarker = Marker(
        markerId: const MarkerId('start'),
        position: startLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Start'),
      );

      final endMarker = Marker(
        markerId: const MarkerId('end'),
        position: state.endLocation,
        infoWindow: const InfoWindow(title: 'Destination'),
      );

      emit(
        state.copyWith(
          markers: {startMarker, endMarker},
          startLocation: startLocation,
          initializing: false,
          initialized: true,
          isLoading: false,
        ),
      );

      await getPolylinePoints(startLocation, state.endLocation);
    } catch (e) {
      emit(state.copyWith(initializing: false)); // Handle error gracefully
      AppLogger.error('Error initializing map: $e', tag: 'Map Cubit');
    }
  }

  // This method retrieves the polyline points based on travel mode
  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    emit(state.copyWith(isLoading: true));
    try {
      final polylinePoints = PolylinePoints();
      final List<LatLng> polylineCoordinates = [];
      final result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: PointLatLng(start.latitude, start.longitude),
          destination: PointLatLng(end.latitude, end.longitude),
          mode: state.travelMode,
        ),
        googleApiKey: _mapKey,
      );
      emit(state.copyWith(isLoading: false));
      if (result.points.isNotEmpty) {
        polylineCoordinates.addAll(result.points.map((p) => LatLng(p.latitude, p.longitude)));

        _drawPolyline(polylineCoordinates);
        final num distance = result.totalDistanceValue ?? 1 / 1000; // Convert to km
        final num duration = result.totalDurationValue ?? 1 / 60; // Convert to minutes

        if (polylineCoordinates.isEmpty) return;
        // Place markers at start, middle, and end
        _addMarkers(
          start,
          end,
          polylineCoordinates[(polylineCoordinates.length / 2).toInt()],
          distance.toDouble(),
          duration.toDouble(),
        );
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map Polyline Error');
    }
  }

  // Method to draw polyline on the map
  void _drawPolyline(List<LatLng> points) {
    final polyline = Polyline(polylineId: const PolylineId('route'), color: Colors.blue, width: 5, points: points);

    emit(state.copyWith(mapRoute: {polyline}));
    _moveCameraToFitPolyline(points);
  }

  // Move the camera to fit the polyline on the map
  void _moveCameraToFitPolyline(List<LatLng> polylinePoints) {
    if (polylinePoints.isNotEmpty) {
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
      if (!isClosed)
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng)),
            50,
          ),
          duration: const Duration(milliseconds: 300),
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
    final BitmapDescriptor middleMarkerIcon = await _createCustomMarker(
      '${distance.toStringAsFixed(2)} km\n${duration.toStringAsFixed(2)} min',
    );

    // Add markers with custom icons
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: start,
      icon: await const Icon(Icons.gps_fixed, color: Colors.blue).toBitmapDescriptor(),
    );

    final endMarker = Marker(markerId: const MarkerId('end'), position: end);

    final middleMarker = Marker(markerId: const MarkerId('middle'), position: middle, icon: middleMarkerIcon);

    emit(state.copyWith(markers: {startMarker, endMarker, middleMarker}));
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
