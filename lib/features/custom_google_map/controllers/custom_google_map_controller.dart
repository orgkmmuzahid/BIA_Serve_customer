// File: custom_google_map_controller.dart

import 'package:bai_serve/component/other_widgets/permission_handler_helper.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
// Get.lazyPut(() => CustomGoogleMapController(), fenix: true);

class CustomGoogleMapController extends GetxController {
  Set<Polyline> mapRoute = {};
  TravelMode _mode = TravelMode.driving;
  final String _mapKey = 'AIzaSyAJrp3VvbO4E4jo7HRgqsk7EP8mPIZStxQ';
  LatLng startLocation = const LatLng(23.798440, 90.412663);
  LatLng endLocation = const LatLng(23.803544, 90.415371);
  late GoogleMapController mapController;

  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    const PermissionHandlerHelper(
      permission: Permission.location,
    ).getStatus().then((status) {
      if (status) {
        Geolocator.getCurrentPosition().then((position) async {
          startLocation = LatLng(position.latitude, position.longitude);
          markers.addAll({
            Marker(
              markerId: const MarkerId('start'),
              icon: await Utils.bitmapDescriptorFromIconData(
                Icons.gps_fixed_sharp,
                size: 30,
                color: Colors.blue,
              ),
              position: startLocation,
              infoWindow: const InfoWindow(title: 'Start'),
            ),
            Marker(
              markerId: const MarkerId('end'),
              position: endLocation,
              infoWindow: const InfoWindow(title: 'Destination'),
            ),
          });

          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: startLocation,
                zoom: 18, // You can adjust zoom level
              ),
            ),
          );

          AppLogger.info('Initial position set', tag: 'Map');

          getPolylinePoints(startLocation, endLocation);

          update();
        });
      }
    });
  }

  void onTravelModeChange(TravelMode mode) {
    _mode = mode;
  }

  Future<void> getPolylinePoints(LatLng start, LatLng end) async {
    startLocation = start;
    endLocation = end;

    final PolylinePoints polylinePoints = PolylinePoints();
    final List<LatLng> polylineCoordinates = [];

    //need api key with route enable.

    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //  googleApiKey:  _mapKey, request: PolylineRequest(origin: start.pointLatLng, destination: end.pointLatLng, mode: _mode),
    // );

    // if (result.points.isNotEmpty) {
    //   for (var point in result.points) {
    //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    //   }
    //   _drawPolyline(polylineCoordinates);
    // }
  }

  void _drawPolyline(List<LatLng> points) {
    mapRoute.clear();
    mapRoute.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        width: 5,
        points: points,
      ),
    );

    update();
  }
}
