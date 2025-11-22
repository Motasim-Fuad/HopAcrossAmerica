import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_text_fields.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/role_selecteor.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/authentication_controller.dart';

class SignupForm extends StatelessWidget {
  final AuthController controller;

  const SignupForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create New Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please fill your detail information.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 24),

          RoleSelectorWidget(
            selectedRole: controller.selectedRole,
            onRoleSelected: controller.setRole,
          ),
          const SizedBox(height: 16),

          CustomTextField(
            label: "Email",
            hintText: "Your email",
            controller: controller.signupEmailController,
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
            prefixIcon: Icons.email_outlined,
            validator: controller.validateEmail,
          ),
          const SizedBox(height: 16),

          CustomTextField(
            label: "Contact Person Name",
            hintText: "Enter person name",
            controller: controller.signupContactPersonController,
            keyboardType: TextInputType.name,
            isPassword: false,
            prefixIcon: Icons.person_outline,
            validator: controller.validateContactPerson,
          ),
          const SizedBox(height: 16),

          CustomTextField(
            label: "Contact Number",
            hintText: "Your contact number",
            controller: controller.signupContactNumberController,
            keyboardType: TextInputType.phone,
            isPassword: false,
            prefixIcon: Icons.phone_outlined,
            validator: controller.validateContactNumber,
          ),
          const SizedBox(height: 16),

          Obx(() => CustomTextField(
            label: "Password",
            hintText: "••••••••••••",
            controller: controller.signupPasswordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: !controller.signupPasswordVisible.value,
            prefixIcon: Icons.lock_outline,
            onSuffixTap: controller.toggleSignupPasswordVisibility,
            suffixIcon: controller.signupPasswordVisible.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            validator: controller.validatePassword,
          )),
          const SizedBox(height: 16),

          Obx(() => CustomTextField(
            label: "Confirm Password",
            hintText: "••••••••••••",
            controller: controller.signupConfirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: !controller.signupConfirmPasswordVisible.value,
            prefixIcon: Icons.lock_outline,
            onSuffixTap: controller.toggleSignupConfirmPasswordVisibility,
            suffixIcon: controller.signupConfirmPasswordVisible.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            validator: controller.validateConfirmPassword,
          )),
          const SizedBox(height: 16),

          Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  value: controller.termsAccepted.value,
                  onChanged: (value) => controller.toggleTermsAccepted(),
                  activeColor: AppColor.prymaryTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2C3E50),
                    ),
                    children: [
                      TextSpan(text: 'I agree to the '),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          color: Color(0xFF3498DB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF3498DB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          const SizedBox(height: 32),

          Obx(() => RoundedButton(
            title: "Verify Email",
            onPress: controller.signup,
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