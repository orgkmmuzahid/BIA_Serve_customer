import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'app_router.gr.dart';

final GlobalKey<NavigatorState> navigatorRouterKey = GlobalKey<NavigatorState>();

final appRouter = AppRouter();

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    /**
     * if(language is not slected then onboard){
     *   appRouter.replace(OnboardingRoute());
     *   return;
     * }
     * 
     * if(is not login){
     *   appRouter.replace(SignInOptionRoute());
     *   return;
     * }
     * 
     * if(login){
     *   appRouter.replace(HomeRoute());
     *   resolver.next();
     * return;
     * }
     */

    resolver.next();
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: navigatorRouterKey);
  @override
  List<AutoRouteGuard> get guards => [AuthGuard()];

  @override
  RouteType get defaultRouteType =>
      CustomRouteType(transitionsBuilder: TransitionsBuilders.fadeIn, duration: const Duration(milliseconds: 300));

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginOptionsRoute.page),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: PlaceOrderRoute.page),
    AutoRoute(page: PickUpInformationRoute.page),
    AutoRoute(page: LoyaltyPointsRoute.page),
    AutoRoute(page: MyRewardsRoute.page),
    AutoRoute(page: OrderDetailsRoute.page),
    AutoRoute(page: PaymentRoute.page),
    AutoRoute(page: CheckoutRoute.page),
    AutoRoute(page: BulkOrderRoute.page),
    AutoRoute(page: DoorToDoorPickupRoute.page),
    AutoRoute(page: NegotiationAssistanceRoute.page),
    AutoRoute(page: ChatRoute.page),
    AutoRoute(page: BulkOrderDetailsRoute.page),
    AutoRoute(page: PurchaseDeliveryRoute.page),
    AutoRoute(page: LanguageRoute.page),
    AutoRoute(page: TermsConditionRoute.page),
    AutoRoute(page: PrivacyPolicyRoute.page),
    AutoRoute(page: ProfileInfoRoute.page),
    AutoRoute(page: MyPaymentRoute.page),
    AutoRoute(page: MessageRoute.page),
    AutoRoute(page: CallingRoute.page),
    AutoRoute(page: VendorSourcingRoute.page),
    AutoRoute(page: AllProductRoute.page),
    AutoRoute(page: ViewProductRoute.page),
    AutoRoute(page: VendorDetailsRoute.page),
    AutoRoute(page: VerifyVendorRoute.page),
    AutoRoute(page: VendorVerifyFormRoute.page),
    AutoRoute(page: MyVendorRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: VerificationStatusRoute.page),
    AutoRoute(page: ReturnProductRoute.page),
    AutoRoute(page: ReturnProductDetailsRoute.page),
    AutoRoute(page: ReturnProcessingRoute.page),
    AutoRoute(page: VendorProofRoute.page),
  ];
}
