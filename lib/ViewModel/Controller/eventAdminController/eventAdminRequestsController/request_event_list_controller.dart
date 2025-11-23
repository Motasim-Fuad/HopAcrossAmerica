import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/event_admin%20_Requests/request_even_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/evenAdmin_request_event_repo/request_enentRepository.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/event_requests_view.dart';

class RequestEventListController extends GetxController {
  final RequestEnentrepository _repository = RequestEnentrepository();

  final events = <RequestEvenModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  Future<void> loadEvents() async {
    try {
      isLoading.value = true;
      final data = await _repository.fetchEvents();
      events.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load events');
    } finally {
      isLoading.value = false;
    }
  }

  void onEventTap(RequestEvenModel event) {
    Get.to(() => EventRequestsView(), arguments: event);
  }
}
