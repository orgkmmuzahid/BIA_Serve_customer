import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';

class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(target: state.startLocation, zoom: 14.0),
                markers: state.markers,
                polylines: state.mapRoute,
                onMapCreated: (cotroller) {
                  context.read<MapCubit>().onMapCreated(cotroller);
                },
              ),

              if (state.isLoading)
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.white54,
                      border: Border.all(width: 1.w, color: AppColors.lightRead),
                    ),
                    child: const CircularProgressIndicator(color: AppColors.primaryColor2),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
