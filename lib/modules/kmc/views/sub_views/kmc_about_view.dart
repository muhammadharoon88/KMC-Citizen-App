import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KMCAboutView extends StatefulWidget {
  const KMCAboutView({super.key});

  @override
  State<KMCAboutView> createState() => _KMCAboutViewState();
}

class _KMCAboutViewState extends State<KMCAboutView> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.kmc.gos.pk/karachi'));
  }

// https://www.kmc.gos.pk/karachi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "ABOUT",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
