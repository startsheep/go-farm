import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.views[controller.currentRout.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentRout.value,
          onTap: (current) => controller.onPageChanged(current),
          items: controller.menus,
        ),
      ),
    );
  }
}
