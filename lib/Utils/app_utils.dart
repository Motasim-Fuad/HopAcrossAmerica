
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';


class Utils {
  /// Changes focus from one field to another
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  /// Generic info snackbar (default style)
  static void infoSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.backgrountColor,
      colorText: AppColor.whiteColor,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }

  /// Success-style snackbar
  static void successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF4CAF50), // Green
      colorText:  AppColor.whiteColor,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }

  /// Error-style snackbar
  static void errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFFF44336), // Red
      colorText:  AppColor.whiteColor,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}