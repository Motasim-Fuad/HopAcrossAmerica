import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/otp_input_field.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/sing_up_otp_controller.dart';

class OtpVerificationView extends StatelessWidget {
  OtpVerificationView({super.key});

  final SingUpOtpController controller = Get.put(SingUpOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                'Verify your email',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 40),

              // SVG Illustration
              SvgPicture.asset(
                ImageAssets.veryEmailSvg,
                height: 220,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),

              // Enter OTP Title
              const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 10),

              // Description - REMOVE Obx() HERE ✅
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                  children: [
                    TextSpan(text: 'We have just sent you '),
                    TextSpan(
                      text: '4 digit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    TextSpan(text: ' code via your email.'),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPInputField(
                    controller: controller.otp1Controller,
                    focusNode: controller.otp1FocusNode,
                    autoFocus: true,
                    onChanged: (value) => controller.onOtpChanged(value, 1),
                  ),
                  OTPInputField(
                    controller: controller.otp2Controller,
                    focusNode: controller.otp2FocusNode,
                    onChanged: (value) => controller.onOtpChanged(value, 2),
                  ),
                  OTPInputField(
                    controller: controller.otp3Controller,
                    focusNode: controller.otp3FocusNode,
                    onChanged: (value) => controller.onOtpChanged(value, 3),
                  ),
                  OTPInputField(
                    controller: controller.otp4Controller,
                    focusNode: controller.otp4FocusNode,
                    onChanged: (value) => controller.onOtpChanged(value, 4),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Verify Button
              Obx(() => RoundedButton(
                title: "Verify",
                onPress: controller.verifyOtp,
                width: double.infinity,
                loading: controller.isLoading.value,
                showLoadingText: true,
                gradientColors: AppColor.primaryGradient,
              )),
              const SizedBox(height: 20),

              // Resend Code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive code? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  Obx(() => controller.isResending.value
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF4A7C8C),
                      ),
                    ),
                  )
                      : TextButton(
                    onPressed: controller.resendOtp,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4A7C8C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}