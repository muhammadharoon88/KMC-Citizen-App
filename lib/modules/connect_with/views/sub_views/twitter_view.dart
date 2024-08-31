import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class TwitterView extends StatefulWidget {
  const TwitterView({super.key});

  @override
  State<TwitterView> createState() => _TwitterView();
}

class _TwitterView extends State<TwitterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyTileColor,
      appBar: CustomAppBar(
        title: "Twitter Ha",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: const Center(child: Text("Twitter")),
    );
  }
}
