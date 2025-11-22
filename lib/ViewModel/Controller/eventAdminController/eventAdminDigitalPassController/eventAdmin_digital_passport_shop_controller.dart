import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdmin_digitalPassportModel/event_adimin_digital_passport_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_shop_repository.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdmin_digital_passport_repository/event_admin_digital_passport_repository.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class EventAdminDigitalPassportShopController extends GetxController {
  final EventAdminDigitalPassportRepository _passportRepository = EventAdminDigitalPassportRepository();
  final EventadminShopRepository _shopRepository = EventadminShopRepository();

  final RxList<EvenadminShopModel> selectedShops = <EvenadminShopModel>[].obs;
  final RxList<EvenadminShopModel> allShops = <EvenadminShopModel>[].obs;
  final RxBool isLoading = false.obs;

  // Data from setup page
  String eventName = '';
  String eventDescription = '';
  String eventLogo = '';
  String fillAmount = '';
  String instructions = '';
  String fromDate = '';
  String toDate = '';
  bool isEditMode = false;
  String? passportId;

  @override
  void onInit() {
    super.onInit();
    _loadArgumentsAndShops();
  }

  Future<void> _loadArgumentsAndShops() async {
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      eventName = args['eventName'] ?? '';
      eventDescription = args['eventDescription'] ?? '';
      eventLogo = args['eventLogo'] ?? '';
      fillAmount = args['fillAmount'] ?? '';
      instructions = args['instructions'] ?? '';
      fromDate = args['fromDate'] ?? '';
      toDate = args['toDate'] ?? '';
      isEditMode = args['isEditMode'] ?? false;
      passportId = args['passportId'];

      // If edit mode, load existing shops
      if (isEditMode && passportId != null) {
        await _loadExistingShops();
      }
    }
    await loadAllShops();
  }

  Future<void> _loadExistingShops() async {
    try {
      final passport = await _passportRepository.getPassportById(passportId!);
      if (passport != null) {
        for (String shopId in passport.shopIds) {
          final shop = await _shopRepository.getShopById(shopId);
          if (shop != null) {
            selectedShops.add(shop);
          }
        }
      }
    } catch (e) {
      print('Error loading existing shops: $e');
    }
  }

  Future<void> loadAllShops() async {
    try {
      isLoading.value = true;
      final shops = await _shopRepository.getAllShops();
      allShops.value = shops;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shops');
    } finally {
      isLoading.value = false;
    }
  }

  void addShop(EvenadminShopModel shop) {
    if (!selectedShops.any((s) => s.id == shop.id)) {
      selectedShops.add(shop);
    }
  }

  void removeShop(String shopId) {
    selectedShops.removeWhere((shop) => shop.id == shopId);
  }

  Future<void> createNewShop() async {
    final result = await Get.toNamed(RouteName.eventAdmin_addShopView);
    if (result != null) {
      await loadAllShops();
    }
  }

  void seePreview() {
    Get.toNamed(
      RouteName.digitalPassportPreviewView,
      arguments: {
        'isPreviewMode': true,
        'eventName': eventName,
        'eventDescription': eventDescription,
        'eventLogo': eventLogo,
        'fillAmount': fillAmount,
        'instructions': instructions,
        'fromDate': fromDate,
        'toDate': toDate,
        'selectedShops': selectedShops.toList(),
        'isEditMode': isEditMode,
        'passportId': passportId,
      },
    );
  }

  Future<void> createOrUpdatePassport() async {
    if (selectedShops.isEmpty) {
      Get.snackbar('Error', 'Please select at least one shop');
      return;
    }

    try {
      isLoading.value = true;

      final passport = EventAdminDigitalPassportModel(
        id: passportId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        eventName: eventName,
        eventDescription: eventDescription,
        eventLogo: eventLogo,
        fillAmount: fillAmount,
        instructions: instructions,
        shopIds: selectedShops.map((shop) => shop.id).toList(),
        fromDate: fromDate,
        toDate: toDate,
        createdAt: DateTime.now(),
        updatedAt: isEditMode ? DateTime.now() : null,
      );

      if (isEditMode) {
        await _passportRepository.updatePassport(passport);
        Get.snackbar('Success', 'Digital passport updated successfully');
      } else {
        await _passportRepository.savePassport(passport);
        Get.snackbar('Success', 'Digital passport created successfully');
      }

      // Go back to list
      Get.until((route) => route.settings.name == RouteName.digitalPassportListView);
    } catch (e) {
      Get.snackbar('Error', 'Failed to save passport');
    } finally {
      isLoading.value = false;
    }
  }
}