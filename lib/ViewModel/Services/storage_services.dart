import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;
import 'package:hopacrossamerica/Model/eventAdminModel/profile/profile.dart';

class StorageService extends GetxService {
  final _storage = GetStorage();

  void saveProfile(UserProfile profile) {
    _storage.write('name', profile.name);
    _storage.write('email', profile.email);
    _storage.write('phone', profile.phone);
    _storage.write('address', profile.address);
  }

  UserProfile getProfile() {
    return UserProfile(
      name: _storage.read('name') ?? 'Lekha Stigner',
      email: _storage.read('email') ?? 'lekha@example.com',
      phone: _storage.read('phone') ?? '+880 1234567890',
      address: _storage.read('address') ?? 'Dhaka, Bangladesh',
    );
  }
}