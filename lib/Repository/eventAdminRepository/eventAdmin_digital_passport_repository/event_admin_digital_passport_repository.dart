import 'package:get_storage/get_storage.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdmin_digitalPassportModel/event_adimin_digital_passport_model.dart';

class EventAdminDigitalPassportRepository {
  final GetStorage _storage = GetStorage();
  static const String _passportsKey = 'digital_passports';

  Future<List<EventAdminDigitalPassportModel>> getAllPassports() async {
    final passportsJson = _storage.read<List>(_passportsKey);
    if (passportsJson == null) return [];
    return passportsJson.map((e) => EventAdminDigitalPassportModel.fromJson(e)).toList();
  }

  Future<void> savePassport(EventAdminDigitalPassportModel passport) async {
    final passports = await getAllPassports();
    passports.add(passport);
    await _storage.write(_passportsKey, passports.map((e) => e.toJson()).toList());
  }

  Future<void> updatePassport(EventAdminDigitalPassportModel passport) async {
    final passports = await getAllPassports();
    final index = passports.indexWhere((p) => p.id == passport.id);
    if (index != -1) {
      passports[index] = passport;
      await _storage.write(_passportsKey, passports.map((e) => e.toJson()).toList());
    }
  }

  Future<void> deletePassport(String passportId) async {
    final passports = await getAllPassports();
    passports.removeWhere((p) => p.id == passportId);
    await _storage.write(_passportsKey, passports.map((e) => e.toJson()).toList());
  }

  Future<EventAdminDigitalPassportModel?> getPassportById(String passportId) async {
    final passports = await getAllPassports();
    try {
      return passports.firstWhere((p) => p.id == passportId);
    } catch (e) {
      return null;
    }
  }
}