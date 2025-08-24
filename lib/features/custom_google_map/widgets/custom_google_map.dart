import 'package:bai_serve_customer/component/search_bar/common_search_bar.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/custom_google_map/widgets/map_search_bar.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../cubit/map_cubit/map_cubit.dart';
import '../cubit/map_cubit/map_state.dart';

class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({required this.widgets, super.key});
  final List<Widget> Function(BuildContext context, MapState state) widgets;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          final cubit = context.read<MapCubit>();
          return Stack(
            children: [
              GoogleMap(
                onTap: (coordinate) {
                  cubit.setPoint(coordinate: coordinate);
                },
                initialCameraPosition: CameraPosition(target: state.starting.coordinate, zoom: 14.0),
                markers: state.markers,
                polylines: state.mapRoute,
                onMapCreated: (cotroller) {
                  context.read<MapCubit>().onMapCreated(cotroller);
                },
              ),

              Align(alignment: Alignment.topCenter, child: _header(cubit, state)),

              ...widgets(context, state),

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

  Widget _header(MapCubit cubit, MapState state) => Card(
    color: getTheme.scaffoldBackgroundColor,
    elevation: 2,
    shadowColor: getTheme.dividerColor,
    child: SizedBox(
      width: Utils.deviceSize.width - 32,
      height: 135.w,
      child: Column(
        children: [
          MapSearchBar(
            icon: GestureDetector(
              onTap: () {
                cubit.setPointType(PointType.starting).then((_) {
                  cubit.setCurrentPosition();
                });
              },
              child: Icon(
                Icons.gps_fixed_outlined,
                color: state.lastPikedPointType == PointType.starting ? AppColors.primaryColor2 : AppColors.disable,
              ),
            ),
            initalAddress: state.starting.address,
            hints: 'Current Address',
            onSubmit: cubit.setCoordinateFromPlaceId,
            onTap: () {
              cubit.setPointType(PointType.starting);
            },
          ).paddingAll(10),

          MapSearchBar(
            icon: GestureDetector(
              onTap: () {
                cubit.setPointType(PointType.destination);
              },
              child: Icon(
                Icons.place,
                color: state.lastPikedPointType == PointType.destination ? AppColors.primaryColor2 : AppColors.disable,
              ),
            ),
            hints: 'Destination Address',
            initalAddress: state.destination.address,
            onSubmit: cubit.setCoordinateFromPlaceId,
            onTap: () {
              cubit.setPointType(PointType.destination);
            },
          ).paddingOnly(left: 10, right: 10, bottom: 10),
        ],
      ),
    ),
  );
}
