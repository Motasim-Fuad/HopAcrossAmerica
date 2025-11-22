
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/ViewModel/Services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices _splashServices=SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:AppColor.backgrountColor,
      body:Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: SvgPicture.asset(ImageAssets.appLogoSvg,),
        ),
      ) ,
    );
  }
}