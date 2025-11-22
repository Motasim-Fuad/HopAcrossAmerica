
import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/eventAdminhome_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventadminhomeController>(() => EventadminhomeController());
  }
}