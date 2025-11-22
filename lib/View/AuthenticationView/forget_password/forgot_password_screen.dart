import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_back_btn.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_text_fields.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor:AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Forgot Password"),
        leading:CustomBackButton(
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
                  Container(
                    child: SvgPicture.asset(
                      ImageAssets.frogotPassword1,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                   Center(
                     child: Text(
                      'No worries!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A7C8C),
                      ),
                                       ),
                   ),
                  const SizedBox(height: 8),

                  Text(
                    'Enter your email address or mobile number and we\'ll send you instructions to reset your password. Let\'s get you back on track quickly and securely!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    label: 'Email',
                    hintText: 'Your email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    validator: controller.validateEmail,
                  ),
                  const SizedBox(height: 32),

                  Obx(() => RoundedButton(
                    title: "Send Code",
                    onPress: controller.sendCode,
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