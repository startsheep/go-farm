import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/data/dummy.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController

  final count = 0.obs;
  RxList<Map<String, dynamic>> chats = chatMessagesDummy;

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

  void increment() => count.value++;
}
