import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({super.key});

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  late WebViewController controller;

  @override
  void initState() {
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
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith('in://') ||
                request.url.startsWith('https://www.instagram.com/')) {
              // Try to launch the Facebook app if possible
              if (await canLaunchUrl(Uri.parse(request.url))) {
                await launchUrl(Uri.parse(request.url));
              } else {
                // Fallback to browser if the Facebook app is not installed
                if (await canLaunchUrl(
                    Uri.parse('https://www.instagram.com/'))) {
                  await launchUrl(Uri.parse('https://www.instagram.com/'));
                }
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.instagram.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Instagram",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
