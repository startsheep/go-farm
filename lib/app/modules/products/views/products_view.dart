import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/products/widgets/farm_card.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:getx_pattern_starter/app/widgets/reusetext_field.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          Get.arguments['title'],
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          // color: AppTheme.primary,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // search bar
              ReuseTextField(
                enabledBorderColor: AppTheme.accent,
                focusColor: AppTheme.primary,
                hintText: 'Cari disini',
                prefixIcon: Icons.search,
                suffixIcon: Icons.filter_list,
                onPressSuffix: () {
                  print('filter');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.farms.length,
                    itemBuilder: (context, index) {
                      final farm = controller.farms[index];
                      return FarmCard(farm: farm);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
