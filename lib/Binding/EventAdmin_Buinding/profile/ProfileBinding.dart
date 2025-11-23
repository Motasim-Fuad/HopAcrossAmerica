
import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/ProfileViewModel.dart';
import 'package:hopacrossamerica/ViewModel/Services/storage_services.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StorageService());
    Get.lazyPut(() => ProfileViewModel());
  }
}
