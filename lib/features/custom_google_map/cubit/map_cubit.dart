import 'dart:convert';

import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/secret_key/secret_key.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/features/custom_google_map/model/place_details.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'map_state.dart';

class MapCubit extends SafeCubit<MapState> {
  MapCubit() : super(MapState.initial());

  final StorageService _storageService = getIt();
  final String _lastLocationKey = 'last_gps';

  late GoogleMapController mapController;

  void onTravelModeChange(TravelMode mode) {
    emit(state.copyWith(travelMode: mode));
    getPolylinePoints(state.starting.coordinate, state.destination.coordinate);
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    emit(state.copyWith(isLoading: true));

    mapController = controller;
    await _initMapAsync();
  }

  Future<void> _initMapAsync() async {
    final isPermitted = await Permission.location.isGranted;

    if (!isPermitted) {
      emit(state.copyWith(initializing: false));
      return;
    }
    final String? getLastLocation = await _storageService.read(_lastLocationKey);

    if (getLastLocation != null) {
      final Position position = Position.fromMap(json.decode(getLastLocation));
      await setPoint(coordinate: LatLng(position.latitude, position.longitude));
    }
    setCurrentPosition();
  }

  Future<void> setCurrentPosition() async {
    try {
      Geolocator.getCurrentPosition().then((position) {
        final startLocation = LatLng(position.latitude, position.longitude);
        _storageService.write(_lastLocationKey, json.encode(position.toJson()));
        setPointType(PointType.starting);
        setPoint(coordinate: startLocation);
      });
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

  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    emit(state.copyWith(isLoading: true));
    try {
      final polylinePoints = PolylinePoints(apiKey: SecretKey.mapKey);
      final List<LatLng> polylineCoordinates = [];
      final request = RoutesApiRequest(
        origin: PointLatLng(start.latitude, start.longitude),
        destination: PointLatLng(end.latitude, end.longitude),
        travelMode: state.travelMode,
      );
      final result = await polylinePoints.getRouteBetweenCoordinatesV2(request: request);
      emit(state.copyWith(isLoading: false));
      if (result.hasRoutes) {
        polylineCoordinates.addAll(
          (result.primaryRoute?.polylinePoints ?? []).map((p) => LatLng(p.latitude, p.longitude)),
        );
        await _drawPolyline(polylineCoordinates);

        if (state.mapRoute.first.points.isEmpty) return;
        final mDistance = result.primaryRoute?.distanceMeters ?? 0;
        final double mDuration = ((result.primaryRoute?.duration ?? 1) / 60);
        _addMarkers(
          start,
          end,
          state.mapRoute.first.points[(state.mapRoute.first.points.length / 2).toInt()],
          (mDistance < 1000 ? '$mDistance m' : '${result.primaryRoute?.distanceKm ?? 0} km'),
          mDuration < 59 ? '${Utils.formatDouble(mDuration)} minutes' : '${Utils.formatDouble(mDuration / 60)} hours',
        );
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Map Polyline Error');
    }
  }

  Future<void> _drawPolyline(List<LatLng> points) async {
    final polyline = Polyline(
      polylineId: const PolylineId('route'),
      color: AppColors.primaryColor,
      width: 5,
      points: points,
    );

    emit(state.copyWith(mapRoute: {polyline}));
    _moveCameraToFitPolyline(points);
  }

  void _moveCameraToFitPolyline(List<LatLng> polylinePoints) {
    if (polylinePoints.isNotEmpty) {
      double minLat = polylinePoints[0].latitude;
      double maxLat = polylinePoints[0].latitude;
      double minLng = polylinePoints[0].longitude;
      double maxLng = polylinePoints[0].longitude;

      for (final point in polylinePoints) {
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

  void _addMarkers(LatLng start, LatLng end, LatLng middle, String distance, String duration) async {
    final BitmapDescriptor middleMarkerIcon = await _createCustomMarker('Distance- $distance\nDuration- $duration');
    final startMarker = Marker(
      markerId: MarkerId(PointType.starting.name),
      position: start,
      icon: await const Icon(Icons.gps_fixed, color: AppColors.primaryColor).toBitmapDescriptor(),
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
      color: AppColors.primaryColor2,
      borderColor: AppColors.primaryColor2,
      borderRadious: 4.r,
      fontWeight: FontWeight.bold,
    ).toBitmapDescriptor();
  }

  Future<void> onPointTypeChange(PointType pointType) async {
    final updatedMarker = state.markers;
    updatedMarker.removeWhere((element) => element.markerId.value == pointType.name);

    emit(state.copyWith(lastPikedPointType: pointType, markers: updatedMarker));
  }

  Future<void> setPointType(PointType pointType) async {
    emit(state.copyWith(lastPikedPointType: pointType));
    AppLogger.debug(pointType.name);
  }

  Future<void> setPoint({required LatLng coordinate}) async {
    final details = await _getPlaceDetails(coordinate.latitude, coordinate.longitude);
    if (state.lastPikedPointType == PointType.starting) {
      _startMarker(coordinate);
      emit(state.copyWith(starting: details));
      getPolylinePoints(coordinate, state.destination.coordinate);
    } else if (state.lastPikedPointType == PointType.destination) {
      _destinationMarker(coordinate);
      emit(state.copyWith(destination: details));
      getPolylinePoints(state.starting.coordinate, coordinate);
    }
  }

  Future<PlaceDetails?> _getPlaceDetails(double latitude, double longitude) async {
    try {
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

  Future<void> setCoordinateFromPlaceId({required String placeId, required String address}) async {
    final url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${SecretKey.mapKey}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final double lat = result['result']['geometry']['location']['lat'];
      final double lng = result['result']['geometry']['location']['lng'];
      final coordinate = LatLng(lat, lng);
      final place = PlaceDetails(address: address, coordinate: coordinate);
      if (state.lastPikedPointType == PointType.starting)
        emit(state.copyWith(starting: place));
      else if (state.lastPikedPointType == PointType.destination)
        emit(state.copyWith(destination: place));
      setPoint(coordinate: coordinate);
    }
  }
}
