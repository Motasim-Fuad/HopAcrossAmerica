import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminDigitalPassController/eventAdmin_digital_passport_setup_controller.dart';

class EventAdminDigitalPassportSetupView extends GetView<EventAdminDigitalPassportSetupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Text(
          controller.isEditMode.value ? 'Edit Digital Passport' : 'Digital Passport Setup',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Event Name', 'Enter event name', controller.eventNameController),
            const SizedBox(height: 16),
            _buildTextField('About the Event', 'Describe about the event...', controller.eventDescriptionController, maxLines: 3),
            const SizedBox(height: 16),
            _buildTextField('Fill Amount', 'e.g., 357 Fill = \$2', controller.fillAmountController),
            const SizedBox(height: 16),
            _buildInstructionsSection(),
            const SizedBox(height: 16),
            _buildLogoUploadSection(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField('From Date', 'MM/DD/YYYY', controller.fromDateController),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField('To Date', 'MM/DD/YYYY', controller.toDateController),
                ),
              ],
            ),
            const SizedBox(height: 24),
            RoundedButton(
              title: "Next",
              onPress: () => controller.goToShopSelection(),
              loading: controller.isLoading.value,
              gradientColors: AppColor.primaryGradient,
              width: double.infinity,
              showLoadingText: true,
              iconSpacing: 8,
              iconPosition: IconPosition.right,
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController textController, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF5B7C99)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF5B7C99).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Instruction Title',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.instructionsController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: '• Tap on the specific store you are visiting from the list.\n• The QR scanner will open automatically.\n• Scan the QR code displayed at that store to get your stamp.',
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF5B7C99)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Logo',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => GestureDetector(
          onTap: controller.uploadLogo,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    controller.eventLogo.value.isEmpty ? Icons.cloud_upload_outlined : Icons.check_circle,
                    size: 40,
                    color: controller.eventLogo.value.isEmpty ? Colors.grey[400] : Colors.green,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.eventLogo.value.isEmpty ? 'Upload' : 'Logo Uploaded',
                    style: TextStyle(
                      color: controller.eventLogo.value.isEmpty ? Colors.grey[600] : Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }
}
