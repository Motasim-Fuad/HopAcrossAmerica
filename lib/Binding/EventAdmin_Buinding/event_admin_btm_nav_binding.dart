// Step 1: Create binding file
// File: lib/ViewModel/Bindings/event_admin_btm_nav_binding.dart

import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminBtmNavController.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminDigitalPassController/eventAdmin_digital_passport_list_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/eventAdminhome_controller.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/ProfileViewModel.dart';
import 'package:hopacrossamerica/ViewModel/Services/storage_services.dart';


class EventAdminBtmNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventAdminBtmNavController());
    Get.lazyPut(() => EventadminhomeController(), fenix: true);
    Get.lazyPut(() => EventAdminDigitalPassportListController());
    Get.lazyPut(()=>ProfileViewModel());
    Get.lazyPut(()=>StorageService());
  }
  }
