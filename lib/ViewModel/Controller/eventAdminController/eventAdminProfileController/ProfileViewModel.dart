import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/profile/profile.dart';
import 'package:hopacrossamerica/ViewModel/Services/storage_services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends GetxController {
  final StorageService _storageService = Get.find();
  final ImagePicker _picker = ImagePicker();

  final profile = Rx<UserProfile?>(null);
  final imageFile = Rx<File?>(null);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    profile.value = _storageService.getProfile();
    nameController.text = profile.value!.name;
    emailController.text = profile.value!.email;
    phoneController.text = profile.value!.phone;
    addressController.text = profile.value!.address;
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75,
      );

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        Get.snackbar(
          'Success',
          'Profile picture updated',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void saveProfile() {
    profile.value = UserProfile(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
    );
    _storageService.saveProfile(profile.value!);
    Get.back();
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}