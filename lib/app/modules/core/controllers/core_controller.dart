import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/cart/views/cart_view.dart';
import 'package:getx_pattern_starter/app/modules/home/views/home_view.dart';
import 'package:getx_pattern_starter/app/modules/profile/views/profile_view.dart';
import 'package:getx_pattern_starter/app/modules/search/views/search_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController
  RxInt currentRout = 0.obs;
  List<BottomNavigationBarItem> menus = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(MdiIcons.barn), label: 'kandang saya'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView()
  ];
  onPageChanged(int index) {
    currentRout.value = index;
  }

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
}
