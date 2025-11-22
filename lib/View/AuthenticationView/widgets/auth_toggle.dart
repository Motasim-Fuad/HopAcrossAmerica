import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/login_singupToggleController.dart';

Widget buildLoginSignUpToggle(LoginSignupToggleController controller) {
  return Container(
    height: 45,
    width: 240,
    decoration: BoxDecoration(
      color: const Color(0xFFE8F4F8),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: controller.switchToLogin,
            child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: double.infinity,
              decoration: BoxDecoration(
                color: controller.isLogin.value
                    ? const Color(0xFF4A7C8C)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                boxShadow: controller.isLogin.value
                    ? [
                  BoxShadow(
                    color: const Color(0xFF4A7C8C).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
                    : [],
              ),
              alignment: Alignment.center,
              child: Text(
                "Log In",
                style: TextStyle(
                  color: controller.isLogin.value
                      ? Colors.white
                      : const Color(0xFF6B7280),
                  fontWeight: controller.isLogin.value
                      ? FontWeight.bold
                      : FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: controller.switchToSignup,
            child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: double.infinity,
              decoration: BoxDecoration(
                color: !controller.isLogin.value
                    ? const Color(0xFF4A7C8C)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                boxShadow: !controller.isLogin.value
                    ? [
                  BoxShadow(
                    color: const Color(0xFF4A7C8C).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
                    : [],
              ),
              alignment: Alignment.center,
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: !controller.isLogin.value
                      ? Colors.white
                      : const Color(0xFF6B7280),
                  fontWeight: !controller.isLogin.value
                      ? FontWeight.bold
                      : FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
      ],
    ),
  );
}