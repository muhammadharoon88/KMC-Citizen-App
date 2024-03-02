import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: AppColors.redColor,
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.whiteColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blueColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          filled: true,
          fillColor: AppColors.greenColor,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintStyle: const TextStyle(
            fontFamily: "FontMain",
            fontStyle: FontStyle.italic,
            color: AppColors.whiteColor,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
