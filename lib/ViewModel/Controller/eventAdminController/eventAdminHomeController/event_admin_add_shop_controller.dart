import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_shop_repository.dart';


class EventAdminAddShopController extends GetxController {
  final EventadminShopRepository _shopRepository = EventadminShopRepository();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final aboutController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactNumberController = TextEditingController();

  final RxString logo = ''.obs;
  final RxString coverImage = ''.obs;
  final RxBool isLoading = false.obs;

  void uploadLogo() {
    logo.value = 'dummy_logo_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  void uploadCoverImage() {
    coverImage.value = 'dummy_cover_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> submitShop() async {
    if (!_validateForm()) return;

    isLoading.value = true;
    try {
      final shop = EvenadminShopModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        email: emailController.text,
        location: locationController.text,
        logo: logo.value,
        about: aboutController.text,
        contactPersonName: contactPersonController.text,
        contactNumber: contactNumberController.text,
        coverImage: coverImage.value,
        createdAt: DateTime.now(),
      );

      await _shopRepository.saveShop(shop);
      Get.back();
      Get.snackbar('Success', 'Shop added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add shop');
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter shop name');
      return false;
    }
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter email');
      return false;
    }
    if (locationController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter location');
      return false;
    }
    if (aboutController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter shop description');
      return false;
    }
    if (contactPersonController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter contact person name');
      return false;
    }
    if (contactNumberController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter contact number');
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    aboutController.dispose();
    contactPersonController.dispose();
    contactNumberController.dispose();
    super.onClose();
  }
}
