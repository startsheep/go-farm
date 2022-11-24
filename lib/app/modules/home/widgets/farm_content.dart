import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmContent extends StatelessWidget {
  final dynamic content;
  const FarmContent({
    Key? key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                content['image'],
                semanticLabel: content['title'],
                excludeFromSemantics: true,
                fit: BoxFit.cover,
                width: Get.width,
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content['title'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: AppTheme.dTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // make adders with icon
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppTheme.dTextColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          content['address']['street'] +
                              ", " +
                              content['address']['city'],
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                            color: AppTheme.dTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // make rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppTheme.primary,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppTheme.primary,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppTheme.primary,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppTheme.primary,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppTheme.primary,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.5',
                        style: GoogleFonts.poppins(
                          color: AppTheme.dTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
