import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void sendCode() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // API call simulation
      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;


        emailController.clear();
      // Navigate to OTP screen
      Get.toNamed(RouteName.forgetPassword_otpVerification, arguments: emailController.text);
    }
  }
}