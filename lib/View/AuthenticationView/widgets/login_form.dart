import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_text_fields.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/authentication_controller.dart';


class LoginForm extends StatelessWidget {
  final AuthController controller;

  const LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hi, Welcome back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sign in to continue exploring the best deals',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 32),

          CustomTextField(
            label: "Email",
            hintText: "Your email",
            controller: controller.loginEmailController,
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
            prefixIcon: Icons.email_outlined,
            validator: controller.validateEmail,
          ),
          const SizedBox(height: 20),

          Obx(() => CustomTextField(
            label: "Password",
            hintText: "••••••••••••",
            controller: controller.loginPasswordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: !controller.loginPasswordVisible.value,
            prefixIcon: Icons.lock_outline,
            onSuffixTap: controller.toggleLoginPasswordVisibility,
            suffixIcon: controller.loginPasswordVisible.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            validator: controller.validatePassword,
          )),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.toggleRememberMe(),
                      activeColor: AppColor.prymaryTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              )),
              TextButton(
                onPressed: controller.forgotPassword,
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFE74C3C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          Obx(() => RoundedButton(
            title: "Log In",
            onPress: controller.login,
            width: double.infinity,
            loading: controller.isLoading.value,
            showLoadingText: true,
            gradientColors: AppColor.primaryGradient,
          )),
        ],
      ),
    );
  }
}