import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  String email = '';

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments ?? '';
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void updatePassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // API call simulation
      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;

      Get.snackbar(
        'Success',
        'Password reset successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to login or home
      Get.offAllNamed(RouteName.auth);
    }
  }
}
