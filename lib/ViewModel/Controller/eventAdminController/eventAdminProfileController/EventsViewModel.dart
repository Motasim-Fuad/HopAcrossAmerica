import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/profile/profile.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminProfileView/dummy_data.dart';

class EventsViewModel extends GetxController {
  final events = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void loadEvents() {
    events.value = DummyData.events;
  }
}