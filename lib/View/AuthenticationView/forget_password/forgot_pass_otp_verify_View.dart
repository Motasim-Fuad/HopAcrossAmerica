import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Assets/image_assets.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/Resource/Compunents/custom_back_btn.dart';
import 'package:hopacrossamerica/View/AuthenticationView/widgets/otp_input_field.dart';
import 'package:hopacrossamerica/ViewModel/Controller/Authentication_Controller/forgot_password_controller/forgot_pass_otp_verify_controller.dart';

class forgetPassOTPVerificationScreen extends StatelessWidget {
  const forgetPassOTPVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(forgetPassOTPVerificationController());

    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("OTP Verification"),
        leading: CustomBackButton(
          onTap: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SvgPicture.asset(
                  ImageAssets.frogotPassword2,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),




                const Text(
                  'Verify Your Identity',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A7C8C),
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'We have just sent you 4 digit code via email.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return OTPInputField(
                      controller: controller.otpControllers[index],
                      focusNode: controller.focusNodes[index],
                      autoFocus: index == 0,
                      onChanged: (value) => controller.onOTPChanged(value, index),
                    );
                  }),
                ),
                const SizedBox(height: 32),

                Obx(() => RoundedButton(
                  title: "Confirm ",
                  onPress: controller.verifyOTP,
                  width: double.infinity,
                  loading: controller.isLoading.value,
                  showLoadingText: true,
                  gradientColors: AppColor.primaryGradient,
                )),
                const SizedBox(height: 24),

                Center(
                  child: Obx(() {
                    if (controller.remainingTime.value > 0) {
                      return Text(
                        'Resend code in ${controller.remainingTime.value}s',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: controller.resendCode,
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4A7C8C),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}