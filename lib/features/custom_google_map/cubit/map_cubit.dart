import 'dart:convert';

import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/secret_key/secret_key.dart';
import 'package:bai_serve_customer/features/custom_google_map/model/place_details.dart';
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
import 'package:http/http.dart' as http;

class MapCubit extends SafeCubit<MapState> {
  MapCubit() : super(MapState.initial());

  late GoogleMapController mapController;

  // This method is used for travel mode changes
  void onTravelModeChange(TravelMode mode) {
    emit(state.copyWith(travelMode: mode));
    getPolylinePoints(state.starting.coordinate, state.destination.coordinate);
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

    // _getAddress(-2.396847, 33.987773); //for testing only
    // _getAddress(23.787543, 90.411245); //for testing only

    try {
      final position = await Geolocator.getCurrentPosition();
      final startLocation = LatLng(position.latitude, position.longitude);

      final startMarker = _startMarker(startLocation);

      final endMarker = _destinationMarker(state.destination.coordinate);

      final startDetails = await _getPlaceDetails(startLocation.latitude, startLocation.longitude);
      if (startDetails == null) return;

      emit(
        state.copyWith(
          markers: {startMarker, endMarker},
          starting: startDetails,
          initializing: false,
          initialized: true,
          isLoading: false,
        ),
      );

      // await getPolylinePoints(startLocation, state.destination.coordinate);
    } catch (e) {
      emit(state.copyWith(initializing: false)); // Handle error gracefully
      AppLogger.error('Error initializing map: $e', tag: 'Map Cubit');
    }
  }

  Marker _destinationMarker(LatLng coordinate) {
    return Marker(
      markerId: const MarkerId('end'),
      position: coordinate,
      infoWindow: const InfoWindow(title: 'Destination'),
    );
  }

  Marker _startMarker(LatLng startLocation) {
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: startLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: 'Start'),
    );
    return startMarker;
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
        googleApiKey: SecretKey.mapKey,
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
      markerId: MarkerId(PointType.starting.name),
      position: start,
      icon: await const Icon(Icons.gps_fixed, color: Colors.blue).toBitmapDescriptor(),
    );

    final endMarker = Marker(markerId: MarkerId(PointType.destination.name), position: end);

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

  Future<void> onPointTypeChange(PointType pointType) async {
    final updatedMarker = state.markers;
    updatedMarker.removeWhere((element) => element.markerId.value == pointType.name);

    emit(state.copyWith(lastPikedPointType: pointType, markers: updatedMarker));
  }

  Future<void> setPointType(PointType pointType) async {
    emit(state.copyWith(lastPikedPointType: pointType));
  }

  Future<void> setPoint({required LatLng coordinate}) async {
    final details = await _getPlaceDetails(coordinate.latitude, coordinate.longitude);
    if (state.lastPikedPointType == PointType.starting) {
      _startMarker(coordinate);
      emit(state.copyWith(starting: details));
    } else if (state.lastPikedPointType == PointType.destination) {
      _destinationMarker(coordinate);
      emit(state.copyWith(destination: details));
      getPolylinePoints(state.starting.coordinate, coordinate);
    }
  }

  Future<PlaceDetails?> _getPlaceDetails(double latitude, double longitude) async {
    try {
      // Reverse Geocoding API (Google Maps Geocoding API or OpenCage API)
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=${SecretKey.mapKey}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final place = data['results'][0]['formatted_address'];
          return PlaceDetails(address: place, coordinate: LatLng(latitude, longitude));
        } else {}
      } else {}
    } catch (e) {}
    return null;
  }

  // Future<void> _getAddress(double latitude, double longitude) async {
  //   Debouncer(delay: const Duration(milliseconds: 300)).call(() async {
  //     final url =
  //         'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&addressdetails=1&accept-language=en';
  //     final response = await http.get(Uri.parse(url));

  //     AppLogger.debug(response.body);
  //   });
  // }
}
