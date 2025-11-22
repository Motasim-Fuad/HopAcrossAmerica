import 'package:get/get.dart';

class LoginSignupToggleController extends GetxController {
  // UI State - Only Toggle Logic
  final isLogin = true.obs;

  // Switch between Login and Signup
  void toggleAuthMode() {
    isLogin.value = !isLogin.value;
  }

  // Switch to Login
  void switchToLogin() {
    if (!isLogin.value) {
      isLogin.value = true;
    }
  }

  // Switch to Signup
  void switchToSignup() {
    if (isLogin.value) {
      isLogin.value = false;
    }
  }

  // Reset to default state
  void reset() {
    isLogin.value = true;
  }
}