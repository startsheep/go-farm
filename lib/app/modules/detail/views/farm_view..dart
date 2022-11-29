import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/detail/controllers/farmdetail_controller.dart';
// import 'package:getx_pattern_starter/app/modules/home/controllers/farm_controller.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FarmView extends GetView<FarmDetailController> {
  const FarmView({super.key});

  @override
  Widget build(BuildContext context) {
    final farm = Get.arguments['farm'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // make search bar transparent
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         AppTheme.primary,
        //         AppTheme.secondary,
        //       ],
        //     ),
        //   ),
        // ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                MdiIcons.shareVariant,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  farm['image'],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    // width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          farm['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          farm['address']['street'] +
                              ', ' +
                              farm['address']['city'] +
                              ', ' +
                              farm['address']['village'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // make icon whatsapp
                      // and make icon share
                      InkWell(
                        child: Icon(
                          MdiIcons.whatsapp,
                          color: AppTheme.primary,
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          // go to google map
                        },
                        child: Icon(
                          MdiIcons.googleMaps,
                          color: AppTheme.danger,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Obx(
            () {
              return TabBar(
                isScrollable: true,
                tabs: controller.tabs,
                indicatorPadding: EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                indicatorColor: AppTheme.primary,
                indicator: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppTheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                controller: controller.tabController,
              );
            },
          ),
          SizedBox(height: 8),
          Expanded(
            child: Obx(
              () {
                return TabBarView(
                  controller: controller.tabController,
                  physics: BouncingScrollPhysics(),
                  children: controller.tabViews.value,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
