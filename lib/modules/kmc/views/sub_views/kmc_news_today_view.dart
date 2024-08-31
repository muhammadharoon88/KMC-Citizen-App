import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';

class KMCNewsTodayView extends StatefulWidget {
  const KMCNewsTodayView({super.key});

  @override
  State<KMCNewsTodayView> createState() => _KMNewsTodayViewState();
}

class _KMNewsTodayViewState extends State<KMCNewsTodayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Today News",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Today News"))],
      ),
    );
  }
}
