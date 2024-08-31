import 'package:kmcapp/modules/connect_with/service/toll_free_call_fuction.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class ConnectWithViewModel {
  // Define the list of items here

  final List<Map<String, dynamic>> connectWithItems = [
    {
      "title": "Facebook",
      "icon": ImageAssets.kmcLogoGrey,
      "route": RouteName.facebookView,
    },
    {
      "title": "Instagram",
      "icon": ImageAssets.kmcLogoGrey,
      "route": RouteName.instagramView,
    },
    {
      "title": "KMC Toll Free Number-1234",
      "icon": ImageAssets.kmcLogoGrey,
      "action": () {
        TollFreeCallFucntion.callNumber('1234');
      },
    },
    {
      "title": "Twitter",
      "icon": ImageAssets.kmcLogoGrey,
      "route": RouteName.twitterView,
    },
    {
      "title": "Write Feedback",
      "icon": ImageAssets.kmcLogoGrey,
      "route": RouteName.writeFeedbackView,
    },
  ];
}
