import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String Function(String?)? validator; // Custom validator function

  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: AppColors.redColor,
        style: const TextStyle(color: AppColors.whiteColor),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.whiteColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
          filled: true,
          fillColor: AppColors.greenColor,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
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

// import 'package:flutter/material.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:get/get.dart';

// class CustomTextField extends StatelessWidget {
//   final IconData prefixIcon;
//   final String hintText;
//   final TextEditingController controller;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final Function(String?)? onValidate; // Callback function to handle validation

//   const CustomTextField({
//     Key? key,
//     required this.prefixIcon,
//     required this.hintText,
//     required this.controller,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.onValidate, // Initialize the callback function
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 44,
//       child: TextFormField(
//         validator: (value) {
//           final errorMessage =
//               onValidate?.call(value); // Call the callback function
//           return errorMessage; // Return the validation message if any
//         },
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         cursorColor: AppColors.redColor,
//         style: const TextStyle(color: AppColors.whiteColor),
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             prefixIcon,
//             color: AppColors.whiteColor,
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.blueColor),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.blueColor),
//           ),
//           filled: true,
//           fillColor: AppColors.greenColor,
//           hintText: hintText,
//           contentPadding: const EdgeInsets.symmetric(vertical: 10),
//           hintStyle: const TextStyle(
//             fontFamily: "FontMain",
//             fontStyle: FontStyle.italic,
//             color: AppColors.whiteColor,
//           ),
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
