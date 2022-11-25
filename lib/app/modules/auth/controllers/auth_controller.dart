import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/auth/provider/auth_provider.dart';
import 'package:getx_pattern_starter/app/routes/app_pages.dart';
import 'package:getx_pattern_starter/app/services/auth_services.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController  \\

  RxBool isHiddenPassword = true.obs;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  final count = 0.obs;
  @override
  void onInit() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.find<AuthProvider>().onInit();
    super.onInit();
  }

  void doLogin() async {
    isLoading(true);
    final response = await Get.find<AuthProvider>()
        .login(phoneController.value.text, passwordController.value.text);
    print(response.body);

    if (response.statusCode == 200) {
      onSuccess();
      isLoading(false);
      AuthServices.setAuth = true;
      AuthServices.setToken = response.body['data']['token'];
      AuthServices.setUser = response.body['data']['user'];
      update();
      Get.offAllNamed(
        Routes.CORE,
      );
      print(AuthServices.getAuth);
    } else {
      isLoading(false);
      onFails(response.body['message']);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onFails(message) {
    Get.snackbar(
      "Gagal",
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      backgroundColor: AppTheme.warning,
    );
  }

  void onSuccess() {
    Get.snackbar(
      "Berhasil",
      "Berhasil Masuk",
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      backgroundColor: AppTheme.success,
    );
  }
}
