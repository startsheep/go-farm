import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselContent extends StatelessWidget {
  dynamic content;
  CarouselContent({
    this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              content['image'],
              semanticLabel: content['title'],
              excludeFromSemantics: true,
              fit: BoxFit.cover,
              width: Get.width,
              colorBlendMode: BlendMode.darken,
              // filterQuality: FilterQuality.high,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                content['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
