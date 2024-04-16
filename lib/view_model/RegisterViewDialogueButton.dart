// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// var selectedGender = "Select Gender".obs;

// void showCustomDialog() {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius:
//             BorderRadius.circular(5.0), // Set your custom border radius here
//       ),
//       child: Container(
//         padding: EdgeInsets.only(top: 16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Select Gender',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "FontMain",
//               ),
//             ),
//             SizedBox(height: 10.0),
//             ListTile(
//               leading: Text(
//                 "Male",
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   fontFamily: "FontMain",
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onTap: () {
//                 selectedGender.value = "Male";

//                 Get.back();
//               },
//             ),
//             ListTile(
//               leading: Text("Female",
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontFamily: "FontMain",
//                     fontWeight: FontWeight.bold,
//                   )),
//               onTap: () {
//                 selectedGender.value = "Female";
//                 Get.back();
//               },
//             ),
//             ListTile(
//               leading: Text("Trans-gender",
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontFamily: "FontMain",
//                     fontWeight: FontWeight.bold,
//                   )),
//               onTap: () {
//                 selectedGender.value = "Trans-gender";
//                 Get.back();
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// **************************************************************************
// **************************************************************************

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Future<String?> showCustomDialog() async {
//   return await Get.dialog<String>(
//     Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius:
//             BorderRadius.circular(5.0), // Set your custom border radius here
//       ),
//       child: Container(
//         padding: EdgeInsets.only(top: 16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Select Gender',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "FontMain",
//               ),
//             ),
//             SizedBox(height: 10.0),
//             ListTile(
//               leading: Text(
//                 "Male",
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   fontFamily: "FontMain",
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onTap: () {
//                 Get.back(result: "Male");
//               },
//             ),
//             ListTile(
//               leading: Text("Female",
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontFamily: "FontMain",
//                     fontWeight: FontWeight.bold,
//                   )),
//               onTap: () {
//                 Get.back(result: "Female");
//               },
//             ),
//             ListTile(
//               leading: Text("Trans-gender",
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontFamily: "FontMain",
//                     fontWeight: FontWeight.bold,
//                   )),
//               onTap: () {
//                 Get.back(result: "Trans-gender");
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// *************************************************************************
// *************************************************************************

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = "Select Gender".obs;

  void showCustomDialog() {
    Get.dialog<String>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FontMain",
                ),
              ),
              SizedBox(height: 10.0),
              ListTile(
                leading: Text(
                  "Male",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "FontMain",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  selectedGender.value = "Male";
                  Get.back(result: "Male");
                },
              ),
              ListTile(
                leading: Text("Female",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "FontMain",
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  selectedGender.value = "Female";
                  Get.back(result: "Female");
                },
              ),
              ListTile(
                leading: Text("Trans-gender",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "FontMain",
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  selectedGender.value = "Trans-gender";
                  Get.back(result: "Trans-gender");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
