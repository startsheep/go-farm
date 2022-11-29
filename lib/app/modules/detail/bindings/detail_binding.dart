import 'package:get/get.dart';

import 'package:getx_pattern_starter/app/modules/detail/controllers/farmdetail_controller.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FarmDetailController>(
      () => FarmDetailController(),
    );

    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
