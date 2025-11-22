import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_edit_shop_controller.dart';


class EditShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventAdminEditShopController>(() => EventAdminEditShopController());
  }
}
