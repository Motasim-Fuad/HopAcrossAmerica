import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class SingUpOtpController extends GetxController {
  // OTP Text Controllers
  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();

  // Focus Nodes
  final otp1FocusNode = FocusNode();
  final otp2FocusNode = FocusNode();
  final otp3FocusNode = FocusNode();
  final otp4FocusNode = FocusNode();

  // Loading state
  final isLoading = false.obs;
  final isResending = false.obs;

  // Email that was passed from signup
  final email = ''.obs;

  // Get complete OTP
  String get otpCode =>
      '${otp1Controller.text}${otp2Controller.text}${otp3Controller.text}${otp4Controller.text}';

  // Check if OTP is complete
  bool get isOtpComplete =>
      otp1Controller.text.isNotEmpty &&
          otp2Controller.text.isNotEmpty &&
          otp3Controller.text.isNotEmpty &&
          otp4Controller.text.isNotEmpty;

  // Set email from previous screen
  void setEmail(String emailAddress) {
    email.value = emailAddress;
  }

  // Handle OTP field changes
  void onOtpChanged(String value, int fieldNumber) {
    if (value.isEmpty) {
      // Move to previous field when deleted
      switch (fieldNumber) {
        case 2:
          otp1FocusNode.requestFocus();
          break;
        case 3:
          otp2FocusNode.requestFocus();
          break;
        case 4:
          otp3FocusNode.requestFocus();
          break;
      }
    } else if (value.length == 1) {
      // Move to next field when entered
      switch (fieldNumber) {
        case 1:
          otp2FocusNode.requestFocus();
          break;
        case 2:
          otp3FocusNode.requestFocus();
          break;
        case 3:
          otp4FocusNode.requestFocus();
          break;
        case 4:
        // Last field - unfocus
          otp4FocusNode.unfocus();
          break;
      }
    }
  }

  // Verify OTP
  Future<void> verifyOtp() async {
    if (!isOtpComplete) {
      Get.snackbar(
        'Error',
        'Please enter complete OTP',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    print('Verifying OTP: $otpCode for email: ${email.value}');

    // Add your OTP verification logic here
    // Example: await authService.verifyOtp(email.value, otpCode);

    isLoading.value = false;

    // Show success message
    Get.snackbar(
      'Success',
      'Email verified successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate to next screen (e.g., Home or Dashboard)
    Get.offAllNamed(RouteName.auth);
  }

  // Resend OTP
  Future<void> resendOtp() async {
    isResending.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    print('Resending OTP to: ${email.value}');

    // Add your resend OTP logic here
    // Example: await authService.resendOtp(email.value);

    isResending.value = false;

    // Clear all fields
    clearOtp();

    // Show success message
    Get.snackbar(
      'Success',
      'OTP has been resent to your email',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Clear all OTP fields
  void clearOtp() {
    otp1Controller.clear();
    otp2Controller.clear();
    otp3Controller.clear();
    otp4Controller.clear();
    otp1FocusNode.requestFocus();
  }

  @override
  void onClose() {
    // Dispose controllers
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();

    // Dispose focus nodes
    otp1FocusNode.dispose();
    otp2FocusNode.dispose();
    otp3FocusNode.dispose();
    otp4FocusNode.dispose();

    super.onClose();
  }
}