
import 'dart:async';

import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';


class SplashServices{
  // UserPreferences userPreferences=UserPreferences();

  void isLogin(){
    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteName.auth);
    // userPreferences.getUser().then((value) {
    //   print(value.token);
    //   if( value.token.toString()=="null"){
    //     //value.token!.isEmpty
    //     Timer(Duration(seconds: 3), () {
    //       Get.offNamed(RouteName.loginView);
    //     });
    //   }else{
    //     Timer(Duration(seconds: 3), () {
    //       Get.offNamed(RouteName.homeView);
    //     });
    //   }
    });
  }
}