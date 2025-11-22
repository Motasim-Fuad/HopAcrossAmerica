import 'package:get/get.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_create_event_controller.dart';


class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventAdminCreateEventController>(() => EventAdminCreateEventController());
  }
}