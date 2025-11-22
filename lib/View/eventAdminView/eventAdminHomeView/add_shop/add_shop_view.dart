import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_add_shop_controller.dart';

class AddShopView extends GetView<EventAdminAddShopController> {
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
        title: const Text(
          'Add New Shop',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Shop Name', 'Enter shop name', controller.nameController),
              const SizedBox(height: 20),
              _buildTextField('Email', 'Enter shop email', controller.emailController),
              const SizedBox(height: 20),
              _buildTextField('Shop Location', 'Enter shop location', controller.locationController),
              const SizedBox(height: 20),
              _buildLogoUploadSection(),
              const SizedBox(height: 20),
              _buildTextField('About the Shop', 'Describe about the shop...', controller.aboutController, maxLines: 3),
              const SizedBox(height: 20),
              _buildTextField('Contact Person Name', 'Enter person name', controller.contactPersonController),
              const SizedBox(height: 20),
              _buildTextField('Contact Number', 'Enter contact number', controller.contactNumberController),
              const SizedBox(height: 20),
              _buildCoverImageUploadSection(),
              const SizedBox(height: 24),

              RoundedButton(title: "Add", onPress: ()=> controller.submitShop(),
                loading: controller.isLoading.value,
                gradientColors: AppColor.primaryGradient,
                width: double.infinity,
                showLoadingText: true,
                iconSpacing: 8,
                iconPosition: IconPosition.right,
                icon: Icons.arrow_forward,
              )
            ],
          ),
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

  Widget _buildLogoUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shop Logo',
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
                    controller.logo.value.isEmpty ? Icons.cloud_upload_outlined : Icons.check_circle,
                    size: 40,
                    color: controller.logo.value.isEmpty ? Colors.grey[400] : Colors.green,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.logo.value.isEmpty ? 'Upload Logo' : 'Logo Uploaded',
                    style: TextStyle(
                      color: controller.logo.value.isEmpty ? Colors.grey[600] : Colors.green,
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

  Widget _buildCoverImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cover Image',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => GestureDetector(
          onTap: controller.uploadCoverImage,
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
                    controller.coverImage.value.isEmpty ? Icons.cloud_upload_outlined : Icons.check_circle,
                    size: 40,
                    color: controller.coverImage.value.isEmpty ? Colors.grey[400] : Colors.green,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.coverImage.value.isEmpty ? 'Upload' : 'Uploaded',
                    style: TextStyle(
                      color: controller.coverImage.value.isEmpty ? Colors.grey[600] : Colors.green,
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
