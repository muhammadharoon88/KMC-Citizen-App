import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class KMCViewModel {
  // Define the list of items here
  final List<Map<String, dynamic>> kmcItems = [
    {
      "title": "About KMC",
      "icon": ImageAssets.kmcAboutIcon,
      "route": RouteName.kMCAboutView,
    },
    {
      "title": "KMC History",
      "icon": ImageAssets.kmcHistoryIcon,
      "route": RouteName.kMCHistoryView,
    },
    {
      "title": "Website",
      "icon": ImageAssets.kmcWebsiteIcon,
      "route": RouteName.kMCWebsiteView,
    },
    {
      "title": "What in the News Today",
      "icon": ImageAssets.kmcNewsTodayIcon,
      "route": RouteName.kMCNewsTodayView,
    },
  ];
}
