import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.secondary,
          elevation: 0,
          title: const Text('Pencarian'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primary,
                  AppTheme.secondary,
                ],
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
