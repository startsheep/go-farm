import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/services/auth_services.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SpUtil.getInstance());
  runApp(
    GetMaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AuthServices.getAuth ? Routes.CORE : Routes.AUTH,
      getPages: AppPages.routes,
      onGenerateRoute: (settings) {
        print(settings);
      },
      routingCallback: (value) {
        print("Routing Callback: ${value}");
      },
    ),
  );
}
