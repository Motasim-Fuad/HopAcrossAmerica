import 'package:get_storage/get_storage.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';

class EventadminShopRepository {
  final GetStorage _storage = GetStorage();
  static const String _shopsKey = 'shops';

  Future<List<EvenadminShopModel>> getAllShops() async {
    final shopsJson = _storage.read<List>(_shopsKey);
    if (shopsJson == null) return [];
    return shopsJson.map((e) => EvenadminShopModel.fromJson(e)).toList();
  }

  Future<void> saveShop(EvenadminShopModel shop) async {
    final shops = await getAllShops();
    shops.add(shop);
    await _storage.write(_shopsKey, shops.map((e) => e.toJson()).toList());
  }

  Future<void> updateShop(EvenadminShopModel shop) async {
    final shops = await getAllShops();
    final index = shops.indexWhere((s) => s.id == shop.id);
    if (index != -1) {
      shops[index] = shop;
      await _storage.write(_shopsKey, shops.map((e) => e.toJson()).toList());
    }
  }

  Future<void> deleteShop(String shopId) async {
    final shops = await getAllShops();
    shops.removeWhere((s) => s.id == shopId);
    await _storage.write(_shopsKey, shops.map((e) => e.toJson()).toList());
  }

  Future<EvenadminShopModel?> getShopById(String shopId) async {
    final shops = await getAllShops();
    try {
      return shops.firstWhere((s) => s.id == shopId);
    } catch (e) {
      return null;
    }
  }
}
