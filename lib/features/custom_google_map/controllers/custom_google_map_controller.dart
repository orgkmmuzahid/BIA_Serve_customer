// File: custom_google_map_controller.dart

import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Get.lazyPut(() => CustomGoogleMapController(), fenix: true);

class CustomGoogleMapController extends GetxController {
  Polyline? mapRoute;
  TravelMode _mode = TravelMode.driving;
  final String _mapKey = "AIzaSyAJrp3VvbO4E4jo7HRgqsk7EP8mPIZStxQ";
  LatLng startLocation = LatLng(23.798440, 90.412663);
  LatLng endLocation = LatLng(23.804055, 90.413168);
  late GoogleMapController mapController;

void onMapCreated(GoogleMapController controller){
 mapController = controller;
}

void onTravelModeChange(TravelMode mode){
  _mode = mode;
}

Future<void> getPolylinePoints(LatLng start, LatLng end) async {
  startLocation = start;
  endLocation = end;

  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
 

  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
   googleApiKey:  _mapKey, request: PolylineRequest(origin: start.pointLatLng, destination: end.pointLatLng, mode: _mode),
  );

  if (result.points.isNotEmpty) {
    for (var point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
    _drawPolyline(polylineCoordinates);
  }

}



void _drawPolyline(List<LatLng> points) {
   mapRoute = Polyline(
      polylineId: PolylineId("route"),
      color: Colors.blue,
      width: 5,
      points: points,
    );
  
  update();
}


}