import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class WriteFeedbackDepartmentwiseView extends StatefulWidget {
  const WriteFeedbackDepartmentwiseView({super.key});

  @override
  State<WriteFeedbackDepartmentwiseView> createState() =>
      _WriteFeedbackDepartmentwiseView();
}

class _WriteFeedbackDepartmentwiseView
    extends State<WriteFeedbackDepartmentwiseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyTileColor,
      appBar: CustomAppBar(
        title: "Write Feedback",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: const Center(child: Text("Feedback")),
    );
  }
}
