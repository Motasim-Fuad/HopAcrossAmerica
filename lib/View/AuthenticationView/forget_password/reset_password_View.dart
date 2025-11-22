import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_back_btn.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_text_fields.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());

    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: Text("Reset Password"),
        leading: CustomBackButton(
          onTap: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),

                  SvgPicture.asset(
                    ImageAssets.frogotPassword3,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),


                  const SizedBox(height: 12),


                  const SizedBox(height: 8),

                  Text(
                    'Create a new password to secure your account',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  Obx(() => CustomTextField(
                    label: 'Enter new Password',
                    hintText: '••••••••••••',
                    controller: controller.newPasswordController,
                    isPassword: !controller.isNewPasswordVisible.value,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: controller.isNewPasswordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onSuffixTap: controller.toggleNewPasswordVisibility,
                    validator: controller.validateNewPassword,
                  )),
                  const SizedBox(height: 20),

                  Obx(() => CustomTextField(
                    label: 'Confirm new Password',
                    hintText: '••••••••••••',
                    controller: controller.confirmPasswordController,
                    isPassword: !controller.isConfirmPasswordVisible.value,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: controller.isConfirmPasswordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onSuffixTap: controller.toggleConfirmPasswordVisibility,
                    validator: controller.validateConfirmPassword,
                  )),
                  const SizedBox(height: 32),

                  Obx(() => RoundedButton(
                    title: "Update Password",
                    onPress: controller.updatePassword,
                    width: double.infinity,
                    loading: controller.isLoading.value,
                    showLoadingText: true,
                    gradientColors: AppColor.primaryGradient,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}