import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/detail/views/farm_view..dart';
import 'package:getx_pattern_starter/app/modules/detail/views/livestock_view..dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return checkRequest();
  }

  Widget _buildFarm(BuildContext context) {
    return FarmView();
  }

  Widget _buildLivestock(BuildContext context) {
    return LivestockView();
  }

  checkRequest() {
    final idPage = Get.parameters['idPage'];
    switch (idPage) {
      case '1':
        return _buildFarm(Get.context!);
      case '2':
        return _buildLivestock(Get.context!);
      default:
        return _buildFarm(Get.context!);
    }
  }
}
