import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart' show EvenadminShopModel;
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdmin_digitalPassportModel/event_adimin_digital_passport_model.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdminHomeRepo/eventAdmin_shop_repository.dart';
import 'package:hopacrossamerica/Repository/eventAdminRepository/eventAdmin_digital_passport_repository/event_admin_digital_passport_repository.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';

class EventAdminDigitalPassportPreviewController extends GetxController {
  final EventAdminDigitalPassportRepository _passportRepository = EventAdminDigitalPassportRepository();
  final EventadminShopRepository _shopRepository = EventadminShopRepository();

  final RxBool isLoading = false.obs;
  final RxBool isPreviewMode = false.obs;

  final Rx<EventAdminDigitalPassportModel?> passport = Rx<EventAdminDigitalPassportModel?>(null);
  final RxList<EvenadminShopModel> shops = <EvenadminShopModel>[].obs;

  // For preview mode
  String? previewEventName;
  String? previewEventDescription;
  String? previewEventLogo;
  String? previewFillAmount;
  String? previewInstructions;
  String? previewFromDate;
  String? previewToDate;
  List<EvenadminShopModel>? previewShops;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;

      if (Get.arguments is Map<String, dynamic>) {
        final args = Get.arguments as Map<String, dynamic>;

        if (args['isPreviewMode'] == true) {
          // Preview mode - use passed data
          isPreviewMode.value = true;
          previewEventName = args['eventName'];
          previewEventDescription = args['eventDescription'];
          previewEventLogo = args['eventLogo'];
          previewFillAmount = args['fillAmount'];
          previewInstructions = args['instructions'];
          previewFromDate = args['fromDate'];
          previewToDate = args['toDate'];
          previewShops = args['selectedShops'];
          shops.value = previewShops ?? [];
        }
      } else if (Get.arguments is String) {
        // View mode - load from database
        final passportId = Get.arguments as String;
        await _loadPassportData(passportId);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load passport data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadPassportData(String passportId) async {
    final loadedPassport = await _passportRepository.getPassportById(passportId);
    if (loadedPassport != null) {
      passport.value = loadedPassport;

      // Load shops
      for (String shopId in loadedPassport.shopIds) {
        final shop = await _shopRepository.getShopById(shopId);
        if (shop != null) {
          shops.add(shop);
        }
      }
    }
  }

  void editPassport() {
    if (passport.value != null) {
      Get.toNamed(
        RouteName.digitalPassportSetupView,
        arguments: passport.value!.id,
      );
    }
  }

  String get displayEventName => isPreviewMode.value ? (previewEventName ?? '') : (passport.value?.eventName ?? '');
  String get displayEventDescription => isPreviewMode.value ? (previewEventDescription ?? '') : (passport.value?.eventDescription ?? '');
  String get displayEventLogo => isPreviewMode.value ? (previewEventLogo ?? '') : (passport.value?.eventLogo ?? '');
  String get displayFillAmount => isPreviewMode.value ? (previewFillAmount ?? '') : (passport.value?.fillAmount ?? '');
  String get displayInstructions => isPreviewMode.value ? (previewInstructions ?? '') : (passport.value?.instructions ?? '');
  String get displayFromDate => isPreviewMode.value ? (previewFromDate ?? '') : (passport.value?.fromDate ?? '');
  String get displayToDate => isPreviewMode.value ? (previewToDate ?? '') : (passport.value?.toDate ?? '');
}