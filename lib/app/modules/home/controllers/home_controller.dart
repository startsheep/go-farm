import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/data/dummy.dart';
import 'package:getx_pattern_starter/app/widgets/carousel_content.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<Map<String, dynamic>> carouselContents = <Map<String, dynamic>>[
    {
      'id': 1,
      'title': 'Pasar Domba',
      'image': 'assets/pgarut.jpg',
    },
    {
      'id': 2,
      'title': 'Pasar Sapi',
      'image': 'assets/psapi.jpg',
    },
    {
      'id': 3,
      'title': 'Pasar Domba mingguan',
      'image': 'assets/pgarut2.jpg',
    },
  ].obs;

  RxList<Map<String, dynamic>> farms = farmsDummy;
  RxList<Map<String, dynamic>> adoptedAnimals = <Map<String, dynamic>>[
    {
      'id': 2,
      'title': 'Kucing Persia',
      'image': 'assets/placeholder.jpg',
      'price': 100000,
      'address': {
        'street': 'Jl. Raya Cibadak',
        'city': 'Bandung',
        'province': 'Jawa Barat',
      },
    },
    {
      'id': 3,
      'title': 'Kucing Anggora',
      'image': 'assets/placeholder.jpg',
      'price': 100000,
      'address': {
        'street': 'Jl. Lohbener',
        'city': 'Indramayu',
        'province': 'Jawa Barat',
      },
    },
    {
      'id': 4,
      'title': 'Amalie kucing persia',
      'image': 'assets/placeholder.jpg',
      'price': 100000,
      'address': {
        'street': 'Jl. Lohbener',
        'city': 'Indramayu',
        'province': 'Jawa Barat',
      },
    },
  ].obs;

  RxList<Map<String, dynamic>> farmAnimals = liveStocksDum;
  // assign carouselContents to a carousel items

  // RxList<Widget> carouselItems =

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
