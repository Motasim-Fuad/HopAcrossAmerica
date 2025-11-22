import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_add_shop_controller.dart';


class AddShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventAdminAddShopController>(() => EventAdminAddShopController());
  }
}
