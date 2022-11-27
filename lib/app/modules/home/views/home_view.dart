import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/home/widgets/livestock_box.dart';
import 'package:getx_pattern_starter/app/modules/home/widgets/farm_content.dart';
import 'package:getx_pattern_starter/app/routes/app_pages.dart';
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
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' Farm',
                style: TextStyle(
                  color: AppTheme.secondary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: AppTheme.secondary,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ReuseTextField(
                enabledBorderColor: AppTheme.accent,
                focusColor: AppTheme.primary,
                hintText: 'Cari disini',
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
            // SingleChildScrollView()
            Expanded(
              child: ListView(
                // primary: false,/
                physics: BouncingScrollPhysics(),
                // semanticChildCount: 2,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TitleBar(
                      title: "Peternakan",
                      sideTittle: "Lihat semua",
                      onTap: () {
                        Get.toNamed(
                          Routes.PRODUCTS,
                          arguments: {
                            'title': 'Peternakan',
                            'type': 'Farm',
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    child: Obx(
                      () {
                        // make gridview
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // reverse: ,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                      title: "Hewan Ternak ",
                      sideTittle: "Lihat semua",
                      onTap: () {
                        Get.toNamed(
                          Routes.PRODUCTS,
                          arguments: {
                            'title': 'Hewan Ternak',
                            'type': 'LiveStock'
                          },
                        );
                      },
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 200,
                    child: Obx(
                      () {
                        // make gridview
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // reverse: ,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 4 / 4,
                          ),
                          itemCount: controller.farmAnimals.length,
                          itemBuilder: (context, index) {
                            final farm = controller.farmAnimals[index];
                            return LiveStockBox(content: farm);
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TitleBar(
                      title: "Hewan adopsi",
                      sideTittle: "Lihat semua",
                      onTap: () {
                        Get.toNamed(
                          Routes.PRODUCTS,
                          arguments: {'title': 'Hewan adopsi'},
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () {
                      // make gridview
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: controller.adoptedAnimals.value.length > 3
                            ? 250
                            : 150,
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // reverse: ,
                          // scrollDirection: Axis.horizontal,

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: controller.adoptedAnimals.length,
                          itemBuilder: (context, index) {
                            final farm = controller.adoptedAnimals[index];
                            return AdoptedAnimal(content: farm);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdoptedAnimal extends StatelessWidget {
  const AdoptedAnimal({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Map<String, dynamic> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 399,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppTheme.dShadow],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            // flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                content['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 20,
            child: Text(
              content['title'],
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
