import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_shop_repository.dart';

class EventAdminEditShopController extends GetxController {
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
  final Rxn<EvenadminShopModel> currentShop = Rxn<EvenadminShopModel>();

  @override
  void onInit() {
    super.onInit();
    final shopId = Get.arguments as String?;
    if (shopId != null) {
      loadShop(shopId);
    }
  }

  Future<void> loadShop(String shopId) async {
    isLoading.value = true;
    try {
      final shop = await _shopRepository.getShopById(shopId);
      if (shop != null) {
        currentShop.value = shop;
        nameController.text = shop.name;
        emailController.text = shop.email;
        locationController.text = shop.location;
        aboutController.text = shop.about;
        contactPersonController.text = shop.contactPersonName;
        contactNumberController.text = shop.contactNumber;
        logo.value = shop.logo;
        coverImage.value = shop.coverImage;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shop');
    } finally {
      isLoading.value = false;
    }
  }

  void uploadLogo() {
    logo.value = 'dummy_logo_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  void uploadCoverImage() {
    coverImage.value = 'dummy_cover_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> updateShop() async {
    if (!_validateForm()) return;
    if (currentShop.value == null) return;

    isLoading.value = true;
    try {
      final shop = EvenadminShopModel(
        id: currentShop.value!.id,
        name: nameController.text,
        email: emailController.text,
        location: locationController.text,
        logo: logo.value,
        about: aboutController.text,
        contactPersonName: contactPersonController.text,
        contactNumber: contactNumberController.text,
        coverImage: coverImage.value,
        createdAt: currentShop.value!.createdAt,
      );

      await _shopRepository.updateShop(shop);
      Get.back();
      Get.snackbar('Success', 'Shop updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update shop');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteShop() async {
    if (currentShop.value == null) return;

    Get.defaultDialog(
      title: 'Delete Shop',
      middleText: 'Are you sure you want to delete this shop?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        Get.back();
        isLoading.value = true;
        try {
          await _shopRepository.deleteShop(currentShop.value!.id);
          Get.back();
          Get.snackbar('Success', 'Shop deleted successfully');
        } catch (e) {
          Get.snackbar('Error', 'Failed to delete shop');
        } finally {
          isLoading.value = false;
        }
      },
    );
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