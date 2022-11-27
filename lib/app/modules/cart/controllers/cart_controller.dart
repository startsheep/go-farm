import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/data/dummy.dart';

class CartController extends GetxController {
  //TODO: Implement CartController
  RxList<Map<String, dynamic>> carts = cartsDum;

  dynamic selectedItem = null;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void removeItem(int index) {
    carts.removeAt(index);
  }
}
