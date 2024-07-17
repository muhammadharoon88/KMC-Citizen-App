import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class GenderController extends GetxController {
  var selectedGender = "Select Gender".obs;

  void showCustomDialog() {
    Get.dialog<String>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FontMain",
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                leading: const Text(
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
                leading: const Text("Female",
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
                leading: const Text("Trans-gender",
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

// ******************************************************
// Custom Gender Drop Down ha...........
// ******************************************************

registerViewGendarDropDown(String selectedGender) {
  final GenderController genderController = Get.put(GenderController());
  return Container(
    height: 70,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: AppColors.blueColor,
      ),
      color: AppColors.greenColor,
    ),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            children: [
              Icon(
                Icons.male_rounded,
                color: AppColors.whiteColor,
              ),
              SizedBox(width: 15),
              Text(
                "Gender",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: "FontMain",
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: GestureDetector(
            onTap: () {
              genderController.showCustomDialog();
            },
            child: Obx(
              () => Container(
                height: 25,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  border: Border.all(color: AppColors.blackColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        genderController.selectedGender.value,
                        /////yahan Change hona choya Screen pr
                        style: const TextStyle(
                          fontFamily: "FontMain",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
