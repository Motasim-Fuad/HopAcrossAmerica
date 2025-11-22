import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/login_form.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/auth_toggle.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/singup_form.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/authentication_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/login_singupToggleController.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final LoginSignupToggleController toggleController =
  Get.put(LoginSignupToggleController());

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: AppColor.backgrountColor,
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.appLogoSvg,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -180,
                ),
                decoration: BoxDecoration(
                  color: AppColor.forgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      Center(
                        child: buildLoginSignUpToggle(toggleController),
                      ),
                      const SizedBox(height: 32),

                      Obx(() {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          child: toggleController.isLogin.value
                              ? LoginForm(
                            key: const ValueKey('login'),
                            controller: authController,
                          )
                              : SignupForm(
                            key: const ValueKey('signup'),
                            controller: authController,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}