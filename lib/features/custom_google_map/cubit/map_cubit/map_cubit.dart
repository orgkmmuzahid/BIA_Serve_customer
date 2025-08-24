import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../use_case/location_initialize_use_case.dart';
import '../use_case/map_rendering_use_case.dart';
import '../use_case/place_details_use_case.dart';
import '../use_case/polyline_use_case.dart';
import 'map_state.dart';

class MapCubit extends SafeCubit<MapState> {
  MapCubit()
    : locationInitUseCase = LocationInitializationUseCase(getIt(), 'last_gps'),
      markerCreationUseCase = MarkerCreationUseCase(),
      polylineUseCase = const PolylineUseCase(),
      placeDetailsUseCase = PlaceDetailsUseCase(),
      super(MapState.initial());
  final LocationInitializationUseCase locationInitUseCase;
  final MarkerCreationUseCase markerCreationUseCase;
  final PolylineUseCase polylineUseCase;
  final PlaceDetailsUseCase placeDetailsUseCase;
  late MapRenderingUseCase mapRenderingUseCase;
  late GoogleMapController mapController;

  void onTravelModeChange(TravelMode mode) {
    emit(state.copyWith(travelMode: mode));
    getPolylinePoints(state.starting.coordinate, state.destination.coordinate);
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    mapController = controller;
    mapRenderingUseCase = MapRenderingUseCase(mapController);
    final permitted = await locationInitUseCase.checkPermission();
    if (!permitted) {
      emit(state.copyWith(initializing: false, isLoading: false));
      return;
    }

    final lastPosition = await locationInitUseCase.loadLastLocation();
    if (lastPosition != null) {
      await setPoint(coordinate: LatLng(lastPosition.latitude, lastPosition.longitude));
    }

    await setCurrentPosition();
    emit(state.copyWith(initializing: false, isLoading: false));
  }

  Future<void> setCurrentPosition() async {
    try {
      final position = await locationInitUseCase.getCurrentPosition();
      if (position == null) {
        emit(state.copyWith(initializing: false));
        return;
      }

      final startLocation = LatLng(position.latitude, position.longitude);
      await locationInitUseCase.savePosition(position);

      setPointType(PointType.starting);
      await setPoint(coordinate: startLocation);
    } catch (e) {
      emit(state.copyWith(initializing: false));
      AppLogger.error('Error initializing map: $e', tag: 'Map Cubit');
    }
  }

  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    emit(state.copyWith(isLoading: true));
    try {
      final responce = await polylineUseCase.getRouteBetweenPoints(start, end, state.travelMode);
      final points = polylineUseCase.getPoints(responce.primaryRoute);
      emit(state.copyWith(isLoading: false));

      AppLogger.debug(points?.length.toString() ?? 'dddd', tag: 'map');

      if (points?.isNotEmpty == true) {
        await mapRenderingUseCase.drawPolyline(points!, (polylines) {
          emit(state.copyWith(mapRoute: polylines));
        });
        final midPoint = points[(points.length / 2).toInt()];

        final distanceMeters = polylineUseCase.calculateDistance(responce.primaryRoute);
        final durationSeconds = polylineUseCase.calculateDuration(responce.primaryRoute);
        final distanceText =
            distanceMeters < 1000 ? '$distanceMeters m' : '${(distanceMeters / 1000).toStringAsFixed(2)} km';
        final durationMinutes = durationSeconds / 60;
        final durationText =
            durationMinutes < 59
                ? '${Utils.formatDouble(durationMinutes)} minutes'
                : '${Utils.formatDouble(durationMinutes / 60)} hours';
        await mapRenderingUseCase.addMarkers(
          start,
          end,
          midPoint,
          distanceText,
          durationText,
          (markers) => emit(state.copyWith(markers: markers)),
          markerCreationUseCase.createCustomMarker,
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      AppLogger.error(e.toString(), tag: 'Map Polyline Error');
    }
  }

  Future<void> onPointTypeChange(PointType pointType) async {
    final updatedMarkers = Set<Marker>.from(state.markers);
    updatedMarkers.removeWhere((element) => element.markerId.value == pointType.name);

    emit(state.copyWith(lastPikedPointType: pointType, markers: updatedMarkers));
  }

  Future<void> setPointType(PointType pointType) async {
    emit(state.copyWith(lastPikedPointType: pointType));
    AppLogger.debug(pointType.name);
  }

  Future<void> setPoint({required LatLng coordinate}) async {
    final details = await placeDetailsUseCase.getPlaceDetails(coordinate.latitude, coordinate.longitude);
    if (state.lastPikedPointType == PointType.starting) {
      emit(state.copyWith(starting: details));
      await getPolylinePoints(coordinate, state.destination.coordinate);
    } else if (state.lastPikedPointType == PointType.destination) {
      emit(state.copyWith(destination: details));
      await getPolylinePoints(state.starting.coordinate, coordinate);
    }
  }

  Future<void> setCoordinateFromPlaceId({required String placeId, required String address}) async {
    final placeDetails = await placeDetailsUseCase.getPlaceDetailsFromPlaceId(placeId, address);
    if (placeDetails == null) return;

    if (state.lastPikedPointType == PointType.starting) {
      emit(state.copyWith(starting: placeDetails));
    } else if (state.lastPikedPointType == PointType.destination) {
      emit(state.copyWith(destination: placeDetails));
    }
    await setPoint(coordinate: placeDetails.coordinate);
  }
}
