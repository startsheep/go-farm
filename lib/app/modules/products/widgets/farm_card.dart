import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

class FarmCard extends StatelessWidget {
  const FarmCard({
    Key? key,
    required this.farm,
  }) : super(key: key);

  final Map<String, dynamic> farm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('farm');
      },
      onLongPress: () {
        // show only description
        showDescription();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [AppTheme.dShadow],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(farm['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                // padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      farm['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      farm['slug'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    // ExpandableText(
                    //   farm['description'] ?? 'description',
                    //   expandText: "Selengkapnya",
                    //   collapseText: "Sembunyikan",
                    //   animation: true,
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: farm['address']['street'] +
                                ', ' +
                                farm['address']['city'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          // display the text with the style you want
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      farm['distance'].toString() + ' km dari lokasi anda',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    // make rating from count rating of farm
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: AppTheme.warning,
                                );
                              },
                              rating: farm['rating'].toDouble(),
                              itemCount: 5,
                              itemSize: 15.0,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              farm['rating'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        // button save
                        Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.chat,
                                size: 15,
                                color: AppTheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.grey,
                              ),
                            ),
                            // button chat
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDescription() {
    Get.bottomSheet(
      Container(
        // height: Get.height * 0.5,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              farm['title'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandableText(
              farm['description'],
              expandText: 'Lihat Selengkapnya',
              collapseText: 'Tutup',
              maxLines: 10,
              linkStyle: TextStyle(
                color: AppTheme.primary,
              ),
            ),
            // show adddress from map
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              farm['address']['street'] +
                  ', ' +
                  farm['address']['city'] +
                  ', ' +
                  farm['address']['province'],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
