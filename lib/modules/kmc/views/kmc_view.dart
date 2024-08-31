import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/modules/kmc/viewModels/kmc_view_model.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class KMCView extends StatefulWidget {
  const KMCView({super.key});

  @override
  State<KMCView> createState() => _KMCViewState();
}

class _KMCViewState extends State<KMCView> {
  final KMCViewModel kmcViewModel = KMCViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "KMC",
          onNotificationPressed: () {},
          badgeCount: counter,
        ),
        body: ListView.builder(
            itemCount: kmcViewModel.kmcItems.length,
            itemBuilder: (context, index) {
              final item = kmcViewModel.kmcItems[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(item['route']);
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(
                      color:
                          AppColors.greenColor, // Set the border color to green
                      width: 0.5, // Optional: Set the border width
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: Image.asset(
                        item['icon'],
                        width: 20,
                        height: 20,
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
            }));
  }
}
