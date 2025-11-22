import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/View/AuthenticationView/sing_otp_verification_view.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/sing_up_otp_controller.dart';

class AuthController extends GetxController {
  // Selected Role
  final selectedRole = ''.obs;

  // Form Keys for separate forms
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  // Login Controllers
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final rememberMe = false.obs;

  // Signup Controllers
  final signupEmailController = TextEditingController();
  final signupContactPersonController = TextEditingController();
  final signupContactNumberController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();
  final termsAccepted = false.obs;

  // Password visibility
  final loginPasswordVisible = false.obs;
  final signupPasswordVisible = false.obs;
  final signupConfirmPasswordVisible = false.obs;

  // Loading state
  final isLoading = false.obs;

  // Set Role
  void setRole(String role) {
    selectedRole.value = role;
  }

  // Toggle Remember Me
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // Toggle Terms Acceptance
  void toggleTermsAccepted() {
    termsAccepted.value = !termsAccepted.value;
  }

  // Toggle Password Visibility
  void toggleLoginPasswordVisibility() {
    loginPasswordVisible.value = !loginPasswordVisible.value;
  }

  void toggleSignupPasswordVisibility() {
    signupPasswordVisible.value = !signupPasswordVisible.value;
  }

  void toggleSignupConfirmPasswordVisibility() {
    signupConfirmPasswordVisible.value = !signupConfirmPasswordVisible.value;
  }

  // Validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
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
    if (value != signupPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateContactPerson(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact person name';
    }
    return null;
  }

  String? validateContactNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact number';
    }
    if (value.length < 10) {
      return 'Please enter a valid contact number';
    }
    return null;
  }

  String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a role';
    }
    return null;
  }

  // Login Action
  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Add your login logic here
      print('Login Email: ${loginEmailController.text}');
      print('Login Password: ${loginPasswordController.text}');
      print('Remember Me: ${rememberMe.value}');

      isLoading.value = false;

      // Show success message
      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Get.toNamed(RouteName.shopperBtmNavView);
      Get.toNamed(RouteName.eventAdminBtmNavView);
    }
  }

  // Signup Action
  Future<void> signup() async {
    if (signupFormKey.currentState!.validate()) {
      if (!termsAccepted.value) {
        Get.snackbar(
          'Error',
          'Please accept Terms & Conditions',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      if (selectedRole.value.isEmpty) {
        Get.snackbar(
          'Error',
          'Please select a role',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Add your signup logic here
      print('Signup Role: ${selectedRole.value}');
      print('Signup Email: ${signupEmailController.text}');
      print('Contact Person: ${signupContactPersonController.text}');
      print('Contact Number: ${signupContactNumberController.text}');

      isLoading.value = false;

      Get.to(
            () => OtpVerificationView(),
        arguments: {'email': signupEmailController.text},
      );

      clearAllFields();
      // Show success message
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // Forgot Password
  void forgotPassword() {
    // Add forgot password logic here
      Get.toNamed(RouteName.forgotPassword);
  }

  // Clear all errors
  void clearErrors() {
    loginFormKey.currentState?.reset();
    signupFormKey.currentState?.reset();
  }

  // Clear all fields
  void clearAllFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    signupEmailController.clear();
    signupContactPersonController.clear();
    signupContactNumberController.clear();
    signupPasswordController.clear();
    signupConfirmPasswordController.clear();
    selectedRole.value = '';
    rememberMe.value = false;
    termsAccepted.value = false;
  }

  // @override
  // void onClose() {
  //   // Dispose controllers
  //   loginEmailController.dispose();
  //   loginPasswordController.dispose();
  //   signupEmailController.dispose();
  //   signupContactPersonController.dispose();
  //   signupContactNumberController.dispose();
  //   signupPasswordController.dispose();
  //   signupConfirmPasswordController.dispose();
  //   super.onClose();
  // }
}