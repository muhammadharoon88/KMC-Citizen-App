// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';

// class MyDrawerHeader extends StatefulWidget {
//   const MyDrawerHeader({super.key});

//   @override
//   State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
// }

// class _MyDrawerHeaderState extends State<MyDrawerHeader> {
//   final List<_DrawerItem> _drawerItems = [
//     _DrawerItem(icon: ImageAssets.homeIcon, title: "Home"),
//     _DrawerItem(icon: ImageAssets.profileIcon, title: "Profile"),
//     _DrawerItem(icon: ImageAssets.fAQIcon, title: "Frequently Asked Ques."),
//     _DrawerItem(icon: ImageAssets.feedbackIcon, title: "Feedback"),
//     _DrawerItem(icon: ImageAssets.logOutIcon, title: "Logout"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage(
//                 ImageAssets.drawerScreenHeaderImage,
//               ),
//               fit: BoxFit.cover,
//             )),
//             height: 180,
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 120,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: AppColors.whiteColor,
//                       width: 5,
//                     ),
//                     image: const DecorationImage(
//                       image: AssetImage(
//                         ImageAssets.kmcLogoGrey,
//                       ),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ..._drawerItems.map((item) => SizedBox(
//                 height: 55,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(0),
//                   ),
//                   child: ListTile(
//                     focusColor: AppColors.greennColor,
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(item.icon),
//                       radius: 12,
//                     ),
//                     title: Text(
//                       item.title,
//                       style: const TextStyle(
//                         color: AppColors.greenDarkColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//           // const SizedBox(
//           //   height: 320,
//           // ),
//           const Spacer(),
//           Container(
//             height: 50,
//             width: double.infinity,
//             color: AppColors.greyColor,
//             child: const Text(
//               "All rights reserved",
//               textAlign: TextAlign.center,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _DrawerItem {
//   late String icon;
//   late String title;

//   _DrawerItem({required this.icon, required this.title});
// }

// ****************************************************************************

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';

// class MyDrawerHeader extends StatefulWidget {
//   const MyDrawerHeader({super.key});

//   @override
//   State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
// }

// class _MyDrawerHeaderState extends State<MyDrawerHeader> {
//   final List<_DrawerItem> _drawerItems = [
//     _DrawerItem(icon: ImageAssets.homeIcon, title: "Home"),
//     _DrawerItem(icon: ImageAssets.profileIcon, title: "Profile"),
//     _DrawerItem(icon: ImageAssets.fAQIcon, title: "Frequently Asked Ques."),
//     _DrawerItem(icon: ImageAssets.feedbackIcon, title: "Feedback"),
//     _DrawerItem(icon: ImageAssets.logOutIcon, title: "Logout"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   ImageAssets.drawerScreenHeaderImage,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             height: screenHeight * 0.25,
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: screenHeight * 0.15,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: AppColors.whiteColor,
//                       width: 5,
//                     ),
//                     image: const DecorationImage(
//                       image: AssetImage(
//                         ImageAssets.kmcLogoGrey,
//                       ),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ..._drawerItems.map((item) => SizedBox(
//                 height: screenHeight * 0.07,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(0),
//                   ),
//                   child: ListTile(
//                     focusColor: AppColors.greennColor,
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(item.icon),
//                       radius: 12,
//                     ),
//                     title: Text(
//                       item.title,
//                       style: const TextStyle(
//                         color: AppColors.greenDarkColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: screenHeight * 0.05),
//                 child: Container(
//                   height: screenHeight * 0.06,
//                   width: double.infinity,
//                   color: AppColors.greyColor,
//                   child: const Center(
//                     child: Text(
//                       "All rights reserved",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DrawerItem {
//   late String icon;
//   late String title;

//   _DrawerItem({required this.icon, required this.title});
// }

// ########################################################################

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';

// class MyDrawerHeader extends StatefulWidget {
//   const MyDrawerHeader({super.key});

//   @override
//   State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
// }

// class _MyDrawerHeaderState extends State<MyDrawerHeader> {
//   final List<_DrawerItem> _drawerItems = [
//     _DrawerItem(icon: ImageAssets.homeIcon, title: "Home"),
//     _DrawerItem(icon: ImageAssets.profileIcon, title: "Profile"),
//     _DrawerItem(icon: ImageAssets.fAQIcon, title: "Frequently Asked Ques."),
//     _DrawerItem(icon: ImageAssets.feedbackIcon, title: "Feedback"),
//     _DrawerItem(icon: ImageAssets.logOutIcon, title: "Logout"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return SizedBox(
//       height: screenHeight,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       ImageAssets.drawerScreenHeaderImage,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 height: screenHeight * 0.25,
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: screenHeight * 0.15,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.whiteColor,
//                           width: 5,
//                         ),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                             ImageAssets.kmcLogoGrey,
//                           ),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ..._drawerItems.map((item) => SizedBox(
//                     height: screenHeight * 0.07,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: ListTile(
//                         focusColor: AppColors.greennColor,
//                         leading: CircleAvatar(
//                           backgroundImage: AssetImage(item.icon),
//                           radius: 12,
//                         ),
//                         title: Text(
//                           item.title,
//                           style: const TextStyle(
//                             color: AppColors.greenDarkColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//           Container(
//             height: screenHeight * 0.06,
//             width: double.infinity,
//             color: AppColors.greyColor,
//             child: const Center(
//               child: Text(
//                 style: TextStyle(fontWeight: FontWeight.bold),
//                 "Copyright 2024, All Rights Reserved",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DrawerItem {
//   late String icon;
//   late String title;

//   _DrawerItem({required this.icon, required this.title});
// }

// *************************************************************************

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/res/fonts/appfonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyDrawerHeader extends StatefulWidget {
//   const MyDrawerHeader({super.key});

//   // final Uri _url = Uri.parse('https://youtube.com');
//   // Future<void> _launchUrl() async {
//   //   if (!await launchUrl(_url)) {
//   //     throw Exception('Could not launch $_url');
//   //   }
//   // }

//   @override
//   State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
// }

// class _MyDrawerHeaderState extends State<MyDrawerHeader> {
//   final List<_DrawerItem> _drawerItems = [
//     _DrawerItem(icon: ImageAssets.homeIcon, title: "Home"),
//     _DrawerItem(icon: ImageAssets.profileIcon, title: "Profile"),
//     _DrawerItem(icon: ImageAssets.fAQIcon, title: "Frequently Asked Ques."),
//     _DrawerItem(icon: ImageAssets.feedbackIcon, title: "Feedback"),
//     _DrawerItem(icon: ImageAssets.logOutIcon, title: "Logout"),
//   ];

//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return SizedBox(
//       height: screenHeight,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       ImageAssets.drawerScreenHeaderImage,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 height: screenHeight * 0.23,
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: screenHeight * 0.15,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.whiteColor,
//                           width: 5,
//                         ),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                             ImageAssets.kmcLogoGrey,
//                           ),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ..._drawerItems.map((item) => GestureDetector(
//                     onTap: () => print("Click Hogaay ha"),
//                     child: SizedBox(
//                       height: screenHeight * 0.06,
//                       child: Card(
//                         margin: EdgeInsets.only(bottom: 2),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         child: ListTile(
//                           focusColor: AppColors.greennColor,
//                           leading: CircleAvatar(
//                             backgroundImage: AssetImage(item.icon),
//                             radius: 12,
//                           ),
//                           title: Text(
//                             item.title,
//                             style: const TextStyle(
//                               fontFamily: AppFonts.appFont,
//                               color: AppColors.greenDarkColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//           Container(
//             height:
//                 screenHeight * 0.06, // Adjusted height to fit two lines of text
//             width: double.infinity,
//             color: AppColors.greyColor,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     style: TextStyle(
//                         fontFamily: AppFonts.appFont,
//                         fontWeight: FontWeight.bold),
//                     "Copyright 2024, All Rights Reserved",
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                       height: 2), // Space between the two lines of text
//                   GestureDetector(
//                     onTap: () async {
//                       final Uri url = Uri.parse('https://www.accuweather.com');
//                       if (await canLaunchUrl(url)) {
//                         await launchUrl(url);
//                       } else {
//                         throw 'Could not launch $url';
//                       }
//                     },
//                     child: const Text(
//                       "https://www.accuweather.com",
//                       style: TextStyle(
//                           fontFamily: AppFonts.appFont,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                           color: Colors.blue),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DrawerItem {
//   late String icon;
//   late String title;

//   _DrawerItem({required this.icon, required this.title});
// }

// on tap pr color change hoga
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  final List<_DrawerItem> _drawerItems = [
    _DrawerItem(
        icon: ImageAssets.homeIcon, title: "Home", route: RouteName.homeView),
    _DrawerItem(
        icon: ImageAssets.profileIcon,
        title: "Profile",
        route: RouteName.profileView),
    _DrawerItem(
        icon: ImageAssets.fAQIcon,
        title: "Frequently Asked Ques.",
        route: RouteName.frequentlyAskQuestView),
    _DrawerItem(
        icon: ImageAssets.feedbackIcon,
        title: "Feedback",
        route: RouteName.feedbackView),
    _DrawerItem(
        icon: ImageAssets.logOutIcon,
        title: "Logout",
        route: RouteName.logoutView),
  ];

  int _selectedIndex = -1;
  bool _isTapped = false;

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isTapped = true;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isTapped = false;
      });

      if (_drawerItems[index].route != null) {
        Get.toNamed(_drawerItems[index].route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ImageAssets.drawerScreenHeaderImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: screenHeight * 0.23,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 5,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                            ImageAssets.kmcLogoGrey,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ..._drawerItems.asMap().entries.map((entry) {
                int index = entry.key;
                _DrawerItem item = entry.value;
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      color: _selectedIndex == index && _isTapped
                          ? AppColors.greenColor
                          : Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item.icon),
                          radius: 12,
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontFamily: AppFonts.appFont,
                            color: AppColors.greenDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          Container(
            height: screenHeight * 0.06,
            width: double.infinity,
            color: AppColors.greyColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    style: TextStyle(
                        fontFamily: AppFonts.appFont,
                        fontWeight: FontWeight.bold),
                    "Copyright 2024, All Rights Reserved",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://www.accuweather.com');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: const Text(
                      "https://www.accuweather.com",
                      style: TextStyle(
                          fontFamily: AppFonts.appFont,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  late String icon;
  late String title;
  late String route;

  _DrawerItem({required this.icon, required this.title, required this.route});
}
