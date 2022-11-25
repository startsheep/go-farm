import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

class ReuseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? focusColor;
  final Color? fillColor;
  final Color? hoverColor;
  final Color? enabledBorderColor;

  final IconData? icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Function? onTap;
  final Function? onSubmitted;

  // final Function? onEditingComplete;
  final dynamic validator;
  final dynamic onPressSuffix;

  ReuseTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText,
    this.icon,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.onPressSuffix,
    this.focusColor,
    this.fillColor,
    this.hoverColor,
    this.enabledBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressSuffix,
          icon: Icon(
            suffixIcon,
            color: suffixIconColor ?? AppTheme.dIconColor,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor ?? AppTheme.dIconColor,
              )
            : null,
        // labelText: "Deskripsi Di Sini Yaa",
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          // color: Color.fromARGB(255, 137, 126, 255),
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              // color: Color.fromARGB(255, 137, 126, 255),
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: focusColor ?? AppTheme.defaultBackground,
            // color: Color.fromARGB(255, 137, 126, 255),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: enabledBorderColor ??
                AppTheme.defaultBackground.withOpacity(0.5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppTheme.danger,
          ),
        ),
      ),
    );
  }
}
