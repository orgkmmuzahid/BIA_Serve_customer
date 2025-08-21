// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  const MapState({
    required this.markers,
    required this.mapRoute,
    required this.travelMode,
    required this.startLocation,
    required this.endLocation,
    required this.initialized,
    required this.initializing,
    required this.isLoading,
  });

  // Create an initial state
  MapState.initial()
    : markers = {},
      mapRoute = {},
      travelMode = TravelMode.driving,
      startLocation = const LatLng(23.772882, 90.420017),
      endLocation = const LatLng(23.772109, 90.419656),
      initialized = false,
      isLoading = false,
      initializing = true;
  final bool isLoading;
  final Set<Marker> markers;
  final Set<Polyline> mapRoute;
  final TravelMode travelMode;
  final LatLng startLocation;
  final LatLng endLocation;
  final bool initialized;
  final bool initializing;

  // Copy constructor for state update

  MapState copyWith({
    bool? isLoading,
    Set<Marker>? markers,
    Set<Polyline>? mapRoute,
    TravelMode? travelMode,
    LatLng? startLocation,
    LatLng? endLocation,
    bool? initialized,
    bool? initializing,
  }) {
    return MapState(
      isLoading: isLoading ?? this.isLoading,
      markers: markers ?? this.markers,
      mapRoute: mapRoute ?? this.mapRoute,
      travelMode: travelMode ?? this.travelMode,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      initialized: initialized ?? this.initialized,
      initializing: initializing ?? this.initializing,
    );
  }

  @override
  List<Object> get props {
    return [isLoading, markers, mapRoute, travelMode, startLocation, endLocation, initialized, initializing];
  }
}
