import 'package:flutter/material.dart';
import 'package:kmcapp/modules/connect_with/view_model/connect_with_view_model.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/res/color/appcolors.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';

class ConnectWithView extends StatefulWidget {
  const ConnectWithView({super.key});

  @override
  State<ConnectWithView> createState() => _ConnectWithView();
}

class _ConnectWithView extends State<ConnectWithView> {
  ConnectWithViewModel connectWithViewModel = ConnectWithViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Connect With KMC",
          onNotificationPressed: () {},
          badgeCount: counter,
        ),
        body: ListView.builder(
            itemCount: connectWithViewModel.connectWithItems.length,
            itemBuilder: (context, index) {
              final item = connectWithViewModel.connectWithItems[index];
              return GestureDetector(
                onTap: () {
                  if (item.containsKey('action')) {
                    item['action']();
                  } else {
                    Get.toNamed(item['route']);
                  }
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(
                      color: AppColors
                          .greenDarkColor, // Set the border color to green
                      width: 0.5, // Optional: Set the border width
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: Image.asset(
                        item['icon'],
                      ),
                    ),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontFamily: AppFonts.appFont,
                        color: AppColors.greenDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            })
        // GestureDetector(
        //   onTap: () {
        //     Get.toNamed(RouteName.facebookView);
        //   },
        //   child: Card(
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.zero,
        //       side: BorderSide(
        //         color:
        //             AppColors.greyDarksTextColor, // Set the border color to green
        //         width: 0.5, // Optional: Set the border width
        //       ),
        //     ),
        //     child: ListTile(
        //       leading: CircleAvatar(
        //           backgroundColor: AppColors.whiteColor,
        //           radius: 20.0,
        //           child: Image.asset(
        //             ImageAssets.kmcLogoGrey,
        //           )),
        //       title: const Text(
        //         "Facebook",
        //         style: TextStyle(
        //           color: AppColors.greenDarkColor,
        //           fontWeight: FontWeight.bold,
        //           fontFamily: AppFonts.appFont,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
