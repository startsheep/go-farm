import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FarmAnimal extends StatelessWidget {
  dynamic content;
  FarmAnimal({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [AppTheme.dShadow]),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              // clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                content['image'],
                fit: BoxFit.cover,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Text(
                          content['title'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: AppTheme.dTextColor.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // const Spacer(),
                      Icon(
                        Icons.favorite_outline_outlined,

                        // color: AppTheme.dPrimaryColor,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          formatRupiah(content['price']),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                            color: AppTheme.dTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        // color: AppTheme.dPrimaryColor,
                        size: 12,
                      ),
                    ],
                  ),
                  // make rating
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatRupiah(int number) {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'id',
      decimalDigits: 0,
      name: 'Rp ',
    );
    return formatCurrency.format(number);
  }
}
