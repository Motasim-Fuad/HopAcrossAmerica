import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_event_model.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_event_repository.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_shop_repository.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class EventAdminCreateEventController extends GetxController {
  final EventadminEventRepository _eventRepository = EventadminEventRepository();
  final EventadminShopRepository _shopRepository = EventadminShopRepository();

  final nameController = TextEditingController();
  final aboutController = TextEditingController();
  final locationController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactNumberController = TextEditingController();

  final RxList<String> images = <String>[].obs;
  final RxList<EvenadminShopModel> selectedShops = <EvenadminShopModel>[].obs; // Changed to list
  final RxList<EvenadminShopModel> suggestedShops = <EvenadminShopModel>[].obs;
  final RxList<EvenadminShopModel> allShops = <EvenadminShopModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool showShopSearch = false.obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadShops();
  }

  Future<void> loadShops() async {
    try {
      final shops = await _shopRepository.getAllShops();
      allShops.value = shops;
      suggestedShops.value = shops.take(2).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shops');
    }
  }

  void searchShops(String query) {
    if (query.isEmpty) {
      suggestedShops.value = allShops.take(2).toList();
    } else {
      suggestedShops.value = allShops
          .where((shop) => shop.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void selectShop(EvenadminShopModel shop) {
    // Check if shop is already selected
    if (!selectedShops.any((s) => s.id == shop.id)) {
      selectedShops.add(shop);
    }
  }

  void removeShop(String shopId) {
    selectedShops.removeWhere((shop) => shop.id == shopId);
  }

  Future<void> editShop(String shopId) async {
    await Get.toNamed(RouteName.eventAdmin_editShopView, arguments: shopId);
    await loadShops();
    // Update selected shops with edited data
    for (int i = 0; i < selectedShops.length; i++) {
      if (selectedShops[i].id == shopId) {
        final updatedShop = await _shopRepository.getShopById(shopId);
        if (updatedShop != null) {
          selectedShops[i] = updatedShop;
        }
      }
    }
  }

  Future<void> deleteShop(String shopId) async {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Shop'),
        content: const Text('Are you sure you want to delete this shop?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await _shopRepository.deleteShop(shopId);
                removeShop(shopId);
                await loadShops();
                Get.back();
                Get.snackbar('Success', 'Shop deleted successfully');
              } catch (e) {
                Get.snackbar('Error', 'Failed to delete shop');
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void addImage(String imagePath) {
    images.add(imagePath);
  }

  void removeImage(int index) {
    images.removeAt(index);
  }

  Future<void> submitEvent() async {
    if (!_validateForm()) return;

    isLoading.value = true;
    try {
      final event = Eventadmin_EventModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        about: aboutController.text,
        location: locationController.text,
        fromDate: fromDateController.text,
        toDate: toDateController.text,
        contactPersonName: contactPersonController.text,
        contactNumber: contactNumberController.text,
        images: images,
        shopId: selectedShops.isNotEmpty ? selectedShops.first.id : null,
        createdAt: DateTime.now(),
      );

      await _eventRepository.saveEvent(event);
      Get.back();
      Get.snackbar('Success', 'Event created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create event');
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter event name');
      return false;
    }
    if (aboutController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter event description');
      return false;
    }
    if (locationController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter location');
      return false;
    }
    if (fromDateController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter from date');
      return false;
    }
    if (toDateController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter to date');
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
    aboutController.dispose();
    locationController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    contactPersonController.dispose();
    contactNumberController.dispose();
    searchController.dispose();
    super.onClose();
  }
}