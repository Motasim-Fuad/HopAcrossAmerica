
import 'package:get/get.dart';
import 'package:hopacrossamerica/Binding/EventAdmin_Buinding/event_admin_btm_nav_binding.dart';
import 'package:hopacrossamerica/View/AuthenticationView/auth_view.dart';
import 'package:hopacrossamerica/View/AuthenticationView/forget_password/forgot_pass_otp_verify_View.dart';
import 'package:hopacrossamerica/View/AuthenticationView/forget_password/forgot_password_screen.dart';
import 'package:hopacrossamerica/View/AuthenticationView/forget_password/reset_password_View.dart';
import 'package:hopacrossamerica/View/SplashView/splash_view.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminBtmNavView.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/add_shop/add_shop_view.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/create_event/create_event_view.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/edit_shop/edit_shop_view.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/home/eventAdminHomeView.dart';
import 'package:hopacrossamerica/View/shopperView/shopperBtmNavView.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/forgot_pass_otp_verify_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/reset_password_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/eventAdminhome_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_add_shop_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_create_event_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_edit_shop_controller.dart';

import 'routes_name.dart';

class AppRouts {
  static approutes ()=>[
    GetPage(
      name: RouteName.splashScreen,
      page: ()=> SplashView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.auth,
      page: () => AuthView(),
    ),
    GetPage(
      name: RouteName.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ForgotPasswordController());
      }),
    ),
    GetPage(
      name: RouteName.forgetPassword_otpVerification,
      page: () => const forgetPassOTPVerificationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => forgetPassOTPVerificationController());
      }),
    ),
    GetPage(
      name: RouteName.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ResetPasswordController());
      }),
    ),
    GetPage(
      name: RouteName.shopperBtmNavView,
      page: () =>  ShopperBtmNavView(),

    ),

    GetPage(
      name: RouteName.eventAdminBtmNavView,
      page: () =>  Eventadminbtmnavview(),
      binding: EventAdminBtmNavBinding(),
    ),


    GetPage(
      name: RouteName.eventAdmin_editShopView,
      page: () =>  EditShopView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EventAdminEditShopController());
      }),
    ),
    GetPage(
      name: RouteName.eventAdmin_addShopView,
      page: () =>  AddShopView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EventAdminAddShopController());
      }),
    ),
    GetPage(
      name: RouteName.eventAdmin_createEventView,
      page: () =>  CreateEventView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EventAdminCreateEventController());
      }),
    ),
    GetPage(
      name: RouteName.eventAdmin_eventAdminHomeView,
      page: () =>  Eventadminhomeview(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EventadminhomeController());
      }),
    ),
  ];
}