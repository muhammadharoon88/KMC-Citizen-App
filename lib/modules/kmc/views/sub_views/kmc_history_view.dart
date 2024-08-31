import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';

class KMCHistoryView extends StatefulWidget {
  const KMCHistoryView({super.key});

  @override
  State<KMCHistoryView> createState() => _KMCHistoryViewState();
}

class _KMCHistoryViewState extends State<KMCHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "HISTORY",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("HISTORY VIEW HA"))],
      ),
    );
  }
}
