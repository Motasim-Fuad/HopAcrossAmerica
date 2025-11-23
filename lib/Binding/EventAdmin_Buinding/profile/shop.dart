import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/ShopsViewModel.dart';

class ShopsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopsViewModel());
  }
}