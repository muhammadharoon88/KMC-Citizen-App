import 'package:url_launcher/url_launcher.dart';

class TollFreeCallFucntion {
  static void callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      // Error handling if the dialer cannot be opened
      print('Could not launch $phoneNumber');
    }
  }
}
