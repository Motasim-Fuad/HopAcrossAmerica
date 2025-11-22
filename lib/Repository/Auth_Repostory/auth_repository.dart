
import 'package:hopacrossamerica/Data/Network/network_api_services.dart';
import 'package:hopacrossamerica/Resource/App_Url/app_url.dart';

class AuthRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    final response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }
}
