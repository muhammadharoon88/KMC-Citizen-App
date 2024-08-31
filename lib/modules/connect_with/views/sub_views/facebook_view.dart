// import 'package:flutter/material.dart';
// import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
// import 'package:kmcapp/modules/home/views/home_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class FacebookView extends StatefulWidget {
//   const FacebookView({super.key});

//   @override
//   State<FacebookView> createState() => _FacebookView();
// }

// class _FacebookView extends State<FacebookView> {
//   late WebViewController controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onHttpError: (HttpResponseError error) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url
//                 .startsWith('https://www.facebook.com/KmcPakistan')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://www.facebook.com/KmcPakistan'));
//   }

//   // https://www.youtube.com/
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Facebook",
//         onNotificationPressed: () {},
//         badgeCount: counter,
//       ),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookView extends StatefulWidget {
  const FacebookView({super.key});

  @override
  State<FacebookView> createState() => _FacebookViewState();
}

class _FacebookViewState extends State<FacebookView> {
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
            if (request.url.startsWith('fb://') ||
                request.url
                    .startsWith('https://www.facebook.com/KmcPakistan')) {
              // Try to launch the Facebook app if possible
              if (await canLaunchUrl(Uri.parse(request.url))) {
                await launchUrl(Uri.parse(request.url));
              } else {
                // Fallback to browser if the Facebook app is not installed
                if (await canLaunchUrl(
                    Uri.parse('https://www.facebook.com/KmcPakistan'))) {
                  await launchUrl(
                      Uri.parse('https://www.facebook.com/KmcPakistan'));
                }
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.facebook.com/KmcPakistan'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Facebook",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
