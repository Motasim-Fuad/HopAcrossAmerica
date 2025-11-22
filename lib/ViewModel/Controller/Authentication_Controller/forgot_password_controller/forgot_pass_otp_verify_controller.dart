import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class forgetPassOTPVerificationController extends GetxController {
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes =
  List.generate(4, (index) => FocusNode());

  RxBool isLoading = false.obs;
  RxInt remainingTime = 53.obs;
  Timer? timer;
  String email = '';

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments ?? '';
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  void startTimer() {
    remainingTime.value = 53;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void onOTPChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String getOTP() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void verifyOTP() async {
    String otp = getOTP();
    if (otp.length != 4) {
      Get.snackbar(
        'Error',
        'Please enter complete OTP',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    // API call simulation
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Navigate to reset password screen
    Get.toNamed(RouteName.resetPassword, arguments: email);
  }

  void resendCode() async {
    startTimer();

    // API call simulation
    await Future.delayed(const Duration(seconds: 1));

    Get.snackbar(
      'Success',
      'OTP code resent successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
