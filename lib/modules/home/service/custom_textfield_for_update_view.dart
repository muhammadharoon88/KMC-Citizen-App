// import 'package:flutter/material.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/res/fonts/appfonts.dart';

// class CustomTextFormFieldForUpdateView extends StatelessWidget {
//   final String hintText;
//   final String labelText;
//   final IconData prefixIcon;
//   final IconData suffixIcon;
//   final TextEditingController controller;

//   const CustomTextFormFieldForUpdateView(
//       {super.key,
//       required this.hintText,
//       required this.labelText,
//       required this.prefixIcon,
//       required this.suffixIcon,
//       required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: TextField(
//         decoration: InputDecoration(
//           // Prefix icon
//           prefixIcon: Icon(
//             prefixIcon,
//             color: AppColors.greenDarkColor,
//           ),

//           // Suffix icon
//           suffixIcon: Icon(
//             suffixIcon,
//             color: AppColors.greyColor,
//           ),

//           // Hint text
//           hintText: hintText,
//           hintStyle: const TextStyle(
//               fontStyle: FontStyle.italic, fontFamily: AppFonts.appFont),

//           // Label text
//           labelText: labelText,
//           labelStyle: const TextStyle(
//               color: AppColors.greyColor,
//               fontStyle: FontStyle.italic,
//               fontFamily: AppFonts.appFont),

//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.redColor, width: 2.0),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         cursorColor: AppColors.redColor,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';

class CustomTextFormFieldForUpdateView extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController controller;
  final bool isBold; // New property to control bold text
  final bool isEditable; // New property to control editing

  const CustomTextFormFieldForUpdateView({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    this.isBold = false, // Default to non-bold
    this.isEditable = true, // Default to editable
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: controller,
        enabled: isEditable, // Use this property to enable/disable editing
        style: TextStyle(
          fontWeight:
              isBold ? FontWeight.bold : FontWeight.normal, // Set boldness
          fontFamily: AppFonts.appFont,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.greenDarkColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: AppColors.greyColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: AppFonts.appFont,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.greyColor,
            fontStyle: FontStyle.italic,
            fontFamily: AppFonts.appFont,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        cursorColor: AppColors.redColor,
      ),
    );
  }
}
