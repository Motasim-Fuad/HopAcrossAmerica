import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdmin_digital_passport_repository/event_admin_digital_passport_repository.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:image_picker/image_picker.dart';

class EventAdminDigitalPassportSetupController extends GetxController {
  final EventAdminDigitalPassportRepository _repository = EventAdminDigitalPassportRepository();

  final eventNameController = TextEditingController();
  final eventDescriptionController = TextEditingController();
  final fillAmountController = TextEditingController();
  final instructionsController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  final RxString eventLogo = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isEditMode = false.obs;

  String? editingPassportId;

  @override
  void onInit() {
    super.onInit();
    // Check if editing
    if (Get.arguments != null && Get.arguments is String) {
      editingPassportId = Get.arguments;
      loadPassportData(editingPassportId!);
    }
  }

  Future<void> loadPassportData(String passportId) async {
    try {
      isLoading.value = true;
      isEditMode.value = true;
      final passport = await _repository.getPassportById(passportId);

      if (passport != null) {
        eventNameController.text = passport.eventName;
        eventDescriptionController.text = passport.eventDescription;
        fillAmountController.text = passport.fillAmount;
        instructionsController.text = passport.instructions;
        fromDateController.text = passport.fromDate;
        toDateController.text = passport.toDate;
        eventLogo.value = passport.eventLogo;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load passport data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadLogo() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // In real app, upload to server and get URL
        eventLogo.value = image.path; // Temporary: use local path
        Get.snackbar('Success', 'Logo uploaded');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload logo');
    }
  }

  void goToShopSelection() {
    if (!_validateForm()) return;

    // Pass data to shop selection
    Get.toNamed(
      RouteName.digitalPassportShopView,
      arguments: {
        'eventName': eventNameController.text,
        'eventDescription': eventDescriptionController.text,
        'eventLogo': eventLogo.value,
        'fillAmount': fillAmountController.text,
        'instructions': instructionsController.text,
        'fromDate': fromDateController.text,
        'toDate': toDateController.text,
        'isEditMode': isEditMode.value,
        'passportId': editingPassportId,
      },
    );
  }

  bool _validateForm() {
    if (eventNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter event name');
      return false;
    }
    if (eventDescriptionController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter event description');
      return false;
    }
    if (fillAmountController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter fill amount');
      return false;
    }
    if (instructionsController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter instructions');
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
    return true;
  }

  @override
  void onClose() {
    eventNameController.dispose();
    eventDescriptionController.dispose();
    fillAmountController.dispose();
    instructionsController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    super.onClose();
  }
}
