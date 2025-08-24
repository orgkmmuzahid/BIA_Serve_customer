import 'dart:convert';

import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class LocationInitializationUseCase {
  const LocationInitializationUseCase(this.storageService, this.lastLocationKey);
  final StorageService storageService;
  final String lastLocationKey;

  Future<bool> checkPermission() async {
    return await Permission.location.isGranted;
  }

  Future<Position?> loadLastLocation() async {
    final jsonString = await storageService.read(lastLocationKey);
    if (jsonString != null) {
      return Position.fromMap(json.decode(jsonString));
    }
    return null;
  }

  Future<Position?> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<void> savePosition(Position position) async {
    await storageService.write(lastLocationKey, json.encode(position.toJson()));
  }
}

class MarkerCreationUseCase {
  Future<Marker> createStartMarker(LatLng coordinate) async {
    return Marker(
      markerId: const MarkerId('start'),
      position: coordinate,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: 'Start'),
    );
  }

  Future<Marker> createDestinationMarker(LatLng coordinate) async {
    return Marker(
      markerId: const MarkerId('end'),
      position: coordinate,
      infoWindow: const InfoWindow(title: 'Destination'),
    );
  }

  Future<BitmapDescriptor> createCustomMarker(String text) async {
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
}
