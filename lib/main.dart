import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
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
