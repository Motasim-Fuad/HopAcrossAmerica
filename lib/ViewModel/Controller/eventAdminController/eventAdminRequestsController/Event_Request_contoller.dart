import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/event_admin%20_Requests/request_even_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/evenAdmin_request_event_repo/request_enentRepository.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/request_profile_view.dart';

class EventRequestsController extends GetxController {
  final RequestEnentrepository _repository = RequestEnentrepository();

  final requests = <RequestModel>[].obs;
  final isLoading = false.obs;
  late RequestEvenModel event;

  @override
  void onInit() {
    super.onInit();
    event = Get.arguments as RequestEvenModel;
    loadRequests();
  }

  Future<void> loadRequests() async {
    try {
      isLoading.value = true;
      final data = await _repository.fetchEventRequests(event.id);
      requests.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load requests');
    } finally {
      isLoading.value = false;
    }
  }

  void onRequestTap(RequestModel request) {
    Get.to(() => RequestProfileView(), arguments: request);
  }
}

// controllers/profile_controller.dart
class RequestProfileController extends GetxController {
  final RequestEnentrepository _repository = RequestEnentrepository();

  final profile = Rxn<ProfileModel>();
  final isLoading = false.obs;
  late RequestModel request;

  @override
  void onInit() {
    super.onInit();
    request = Get.arguments as RequestModel;
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      isLoading.value = true;
      final data = await _repository.fetchProfile(request.id);
      profile.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> acceptRequest() async {
    try {
      final success = await _repository.acceptRequest(request.id);
      if (success) {
        Get.snackbar('Success', 'Request accepted');
        Get.back();
        Get.back(); // Go back to event list
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to accept request');
    }
  }

  Future<void> rejectRequest() async {
    try {
      final success = await _repository.rejectRequest(request.id);
      if (success) {
        Get.snackbar('Rejected', 'Request rejected');
        Get.back();
        Get.back(); // Go back to event list
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to reject request');
    }
  }
}
