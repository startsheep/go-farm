import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBar extends StatelessWidget {
  String? title;
  String? sideTittle;
  VoidCallback? onTap;
  TitleBar({
    this.title,
    this.sideTittle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            sideTittle ?? 'side title',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
