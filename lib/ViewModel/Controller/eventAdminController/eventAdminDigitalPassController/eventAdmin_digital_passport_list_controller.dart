import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdmin_digitalPassportModel/event_adimin_digital_passport_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdmin_digital_passport_repository/event_admin_digital_passport_repository.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class EventAdminDigitalPassportListController extends GetxController {
  final EventAdminDigitalPassportRepository _repository = EventAdminDigitalPassportRepository();

  final RxList<EventAdminDigitalPassportModel> passports = <EventAdminDigitalPassportModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPassports();
  }

  Future<void> loadPassports() async {
    try {
      isLoading.value = true;
      final allPassports = await _repository.getAllPassports();
      passports.value = allPassports;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load passports');
    } finally {
      isLoading.value = false;
    }
  }

  void viewPassport(String passportId) {
    Get.toNamed(RouteName.digitalPassportPreviewView, arguments: passportId);
  }

  void createNewPassport() {
    Get.toNamed(RouteName.digitalPassportSetupView);
  }
}