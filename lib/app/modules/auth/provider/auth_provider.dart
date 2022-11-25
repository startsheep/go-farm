import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/services/auth_services.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://gofarm.startsheep.my.id/api/';
  }

  Future<Response> login(String phone, String password) async {
    return await post('auth/login', {
      'phone': phone,
      'password': password,
    });
  }

  Future<Response> logout() async {
    return await post('auth/logout', {}, headers: {
      'Authorization': 'Bearer ' + AuthServices.getToken,
    });
  }
}
