import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';

class KMCWebsiteView extends StatefulWidget {
  const KMCWebsiteView({super.key});

  @override
  State<KMCWebsiteView> createState() => _KMCWebsiteViewState();
}

class _KMCWebsiteViewState extends State<KMCWebsiteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Website",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("website VIEW HA"))],
      ),
    );
  }
}
