import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_event_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_event_repository.dart';


class EventadminhomeController extends GetxController {
  final EventadminEventRepository _eventRepository = EventadminEventRepository();

  final RxList<Eventadmin_EventModel> events = <Eventadmin_EventModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  Future<void> loadEvents() async {
    isLoading.value = true;
    try {
      final eventsList = await _eventRepository.getAllEvents();
      events.value = eventsList;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load events');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteEvent(String eventId) async {
    try {
      await _eventRepository.deleteEvent(eventId);
      await loadEvents();
      Get.snackbar('Success', 'Event deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete event');
    }
  }
}