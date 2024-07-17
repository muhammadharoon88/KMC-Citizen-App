import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String Function(String?)? validator; // Custom validator function
  final Color? fillColor;

  CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Debugging print statements
    print('CustomTextField - hintText: $hintText, fillColor: $fillColor');

    Color hintTextColor = fillColor == AppColors.greenColor
        ? AppColors.whiteColor
        : AppColors.greyDarksTextColor;
    Color iconColor = fillColor == AppColors.greenColor
        ? AppColors.whiteColor
        : AppColors.greyDarksTextColor;

    // Debugging print statements
    print(
        'CustomTextField - hintTextColor: $hintTextColor, iconColor: $iconColor');

    return SizedBox(
      height: 44,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: AppColors.redColor,
        style: TextStyle(color: hintTextColor),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(
            fontFamily: "FontMain",
            fontStyle: FontStyle.italic,
            color: hintTextColor,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}



// Colors manually enter karna ha..

// import 'package:flutter/material.dart';
// import 'package:kmcapp/res/color/appcolors.dart';

// class CustomTextField extends StatelessWidget {
//   final IconData prefixIcon;
//   final String hintText;
//   final TextEditingController controller;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final String Function(String?)? validator; // Custom validator function
//   final Color? iconColor;
//   final Color? fillColor;
//   final Color? hintTextColor;

//   CustomTextField({
//     Key? key,
//     required this.prefixIcon,
//     required this.hintText,
//     required this.controller,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//     this.iconColor,
//     this.fillColor,
//     this.hintTextColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Determine colors based on provided or default values
//     Color finalHintTextColor = hintTextColor ??
//         (fillColor == AppColors.greenColor
//             ? AppColors.whiteColor
//             : AppColors.greyDarksTextColor);
//     Color finalIconColor = iconColor ??
//         (fillColor == AppColors.greenColor
//             ? AppColors.whiteColor
//             : AppColors.greyDarksTextColor);

//     return SizedBox(
//       height: 44,
//       child: TextFormField(
//         validator: validator,
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         cursorColor: AppColors.redColor,
//         style: TextStyle(color: finalHintTextColor),
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             prefixIcon,
//             color: finalIconColor,
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.blueColor),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.blueColor),
//           ),
//           filled: true,
//           fillColor: fillColor,
//           hintText: hintText,
//           contentPadding: const EdgeInsets.symmetric(vertical: 10),
//           hintStyle: TextStyle(
//             fontFamily: "FontMain",
//             fontStyle: FontStyle.italic,
//             color: finalHintTextColor,
//           ),
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
