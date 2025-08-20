import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/auth_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/auth_state.dart';
import 'package:bai_serve_customer/features/auth/model/user_login_info_model.dart';
import 'package:bai_serve_customer/features/home/cubit/home_cubit.dart';
import 'package:bai_serve_customer/features/home/cubit/home_state.dart';
import 'package:bai_serve_customer/features/home/widgets/home_content.dart';
import 'package:bai_serve_customer/features/home/widgets/home_drawer.dart';
import 'package:bai_serve_customer/features/order/my_order/screens/my_order_screen.dart';
import 'package:bai_serve_customer/features/order/tracking_order/screens/tracking_order_screen.dart';
import 'package:bai_serve_customer/features/setting/screens/setting_screen.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/navigator_icon_builder_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => HomeCubit()..fetchBannerUrls(),
    child: LayoutBuilder(
      builder: (context, constrain) {
        return Scaffold(
          appBar: CommonAppBar(leading: _leading(), isCenterTitle: false, titleWidget: _title()),
          drawer: BlocSelector<AuthCubit, AuthState, UserLoginInfoModel>(
            selector: (state) => state.userLoginInfoModel,
            builder: (context, state) => HomeDrawer(userName: state.name, address: state.address),
          ),
          body: Padding(padding: const EdgeInsets.only(left: 16, right: 16), child: _pageInjector()),
          bottomNavigationBar: _bottomBar(context),
        );
      }
    ),
  );

  Widget _bottomBar(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    final navItems = [
      MapEntry(AppString.navHome, AppImages.navHome),
      MapEntry(AppString.navMyOrder, AppImages.navMyOrder),
      MapEntry(AppString.navTrackingOrder, AppImages.navTrackingOrder),
      MapEntry(AppString.navAccount, AppImages.navAccount),
    ];

    return BlocSelector<HomeCubit, HomeStates, int>(
      selector: (state) => state.currentNavigatonPage,
      builder: (context, currentPageIndex) {
        return BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 2),
          notchMargin: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              return NavigatorIconBuilderWidget(
                navIcon: navItems[index],
                index: index,
                currentPage: currentPageIndex,
                cubit: cubit,
              );
            }),
          ),
        );
      },
    );
  }

  BlocSelector<HomeCubit, HomeStates, int> _pageInjector() {
    return BlocSelector<HomeCubit, HomeStates, int>(
      selector: (state) {
        return state.currentNavigatonPage;
      },
      builder: (context, state) {
        return IndexedStack(
          index: state,
          children: [const HomeContent(), MyOrderScreen(), const TrackingOrderScreen(), const SettingScreen()],
        );
      },
    );
  }

  Widget _title() {
    return BlocSelector<AuthCubit, AuthState, UserLoginInfoModel>(
      selector: (state) => state.userLoginInfoModel,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(state.name, style: getTheme.textTheme.titleMedium?.copyWith(color: getTheme.primaryColor)),
            Text(state.address, style: getTheme.textTheme.bodyMedium),
          ],
        );
      },
    );
  }

  Builder _leading() {
    return Builder(
      builder:
          (context) => IconButton(
            icon: Icon(Icons.menu, color: getTheme.textTheme.bodyMedium?.color),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
    );
  }
}
