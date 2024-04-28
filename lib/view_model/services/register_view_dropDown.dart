// import 'package:flutter/material.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/view_model/RegisterViewDialogueButton.dart';
// // ignore: depend_on_referenced_packages
// import 'package:get/get.dart';

// registerViewGendarDropDown() {
//   final GenderController genderController = Get.put(GenderController());
//   return Container(
//     height: 70,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//         color: AppColors.blueColor,
//       ),
//       color: AppColors.greenColor,
//     ),
//     child: Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 10, top: 5),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.male_rounded,
//                 color: AppColors.whiteColor,
//               ),
//               SizedBox(width: 15),
//               Text(
//                 "Gender",
//                 style: TextStyle(
//                   color: AppColors.whiteColor,
//                   fontFamily: "FontMain",
//                   fontSize: 16,
//                 ),
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 50),
//           child: GestureDetector(
//             onTap: () {
//               genderController.showCustomDialog();
//             },
//             child: Obx(
//               () => Container(
//                 height: 25,
//                 decoration: BoxDecoration(
//                   color: AppColors.greyColor,
//                   border: Border.all(color: AppColors.blackColor),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         genderController.selectedGender.value,
//                         /////yahan Change hona choya Screen pr
//                         style: const TextStyle(
//                           fontFamily: "FontMain",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Icon(Icons.keyboard_arrow_down_sharp),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
