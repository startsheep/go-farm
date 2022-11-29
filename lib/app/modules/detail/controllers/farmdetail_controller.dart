import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/data/dummy.dart';
import 'package:getx_pattern_starter/app/modules/detail/views/about_farm_view.dart';
import 'package:getx_pattern_starter/app/modules/detail/views/testimonials_view.dart';
import 'package:getx_pattern_starter/app/modules/detail/widgets/livestocks_widget.dart';

class FarmDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement FarmdetailController
  // TabController tabController = TabController(length: 3, vsync: );
  late TabController tabController;
  RxList<Map<String, dynamic>> liveStocks = liveStocksDum;
  RxList<Map<String, dynamic>> testimonials = testimonialsDummy;
  RxList<Widget> tabs = <Widget>[
    Tab(text: 'Kandang'),
    Tab(
      text: 'Testimoni',
    ),
    // Tab(
    //     // text: 'Products',
    //     ),
    Tab(
      text: 'Tentang',
    ),
    // Tab(
    //   text: 'Kontak',
    // ),
  ].obs;
  RxList<Widget> tabViews = <Widget>[
    LiveStocksWidget(),
    TestimonialsView(),
    AboutFarmView(),
    // Container(
    //   child: Center(
    //     child: Text('Products'),
    //   ),
    // ),
    // Container(
    //   child: Center(
    //     child: Text('Products'),
    //   ),
    // ),
  ].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
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
