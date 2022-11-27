import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kandang Saya'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: controller.carts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        // shape: BoxShape.,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 199, 199, 199)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 2,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              controller.carts[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.carts[index]['title'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.carts[index]['price']
                                            .toString() ??
                                        '0',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Icon delete
                          Container(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              onPressed: () {
                                controller.removeItem(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // make button checkout
          Container(
            width: Get.width,
            margin: EdgeInsets.all(10),
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
