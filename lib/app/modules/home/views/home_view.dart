import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/home/widgets/farm_content.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:getx_pattern_starter/app/widgets/carousel_content.dart';
import 'package:getx_pattern_starter/app/widgets/reusetext_field.dart';
import 'package:getx_pattern_starter/app/widgets/title_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text.rich(
          TextSpan(
            text: 'Go',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' Farm',
                style: TextStyle(
                  color: AppTheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ReuseTextField(
                hintText: 'Search',
                prefixIcon: Icons.search,
                suffixIcon: Icons.filter_list,
                onPressSuffix: () {
                  print('filter');
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () {
                return CarouselSlider(
                  items: controller.carouselContents
                      .map((element) => CarouselContent(content: element))
                      .toList(),
                  options: CarouselOptions(
                    height: 150.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    // enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    viewportFraction: 0.8,
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            // SingleChildScrollView()
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TitleBar(
                title: "Peternakan",
                sideTittle: "Lihat semua",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: Obx(
                () {
                  // make gridview
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // reverse: ,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4 / 4,
                    ),
                    itemCount: controller.farms.length,
                    itemBuilder: (context, index) {
                      final farm = controller.farms[index];
                      return FarmContent(
                        content: farm,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TitleBar(
                title: "Gambar 360",
                sideTittle: "Lihat semua",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TitleBar(
                title: "Hewan Adopsi",
                sideTittle: "Lihat semua",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
