import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/profile/profile.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminProfileView/dummy_data.dart';

class ShopsViewModel extends GetxController {
  final shops = <Shop>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadShops();
  }

  void loadShops() {
    shops.value = DummyData.shops;
  }

  List<Shop> get filteredShops {
    if (searchQuery.value.isEmpty) {
      return shops;
    }
    return shops.where((shop) =>
    shop.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        shop.description.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }

  void search(String query) {
    searchQuery.value = query;
  }
}