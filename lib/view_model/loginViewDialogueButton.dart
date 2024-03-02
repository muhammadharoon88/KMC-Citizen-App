import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5.0), // Set your custom border radius here
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
                Get.back();
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
                Get.back();
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
                Get.back();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
