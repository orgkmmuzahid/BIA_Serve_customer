import 'package:bai_serve_customer/features/custom_google_map/controllers/custom_google_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<CustomGoogleMapController>(
    builder: (controller) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(target: controller.startLocation, zoom: 16),
        polylines: controller.mapRoute,
        markers: controller.markers,
        onMapCreated: controller.onMapCreated,
      );
    },
  );
}
