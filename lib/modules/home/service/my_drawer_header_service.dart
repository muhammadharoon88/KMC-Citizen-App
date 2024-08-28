import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kmcapp/modules/authentication/services/auth_services.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerHeader extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MyDrawerHeader({super.key, required this.scaffoldKey});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  // BuildContext? drawerContext;
  final List<_DrawerItem> _drawerItems = [
    _DrawerItem(
        icon: ImageAssets.homeIcon, title: "Home", route: RouteName.homeView),
    _DrawerItem(
        icon: ImageAssets.profileIcon,
        title: "Profile",
        route: RouteName.updateProfileView),
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

  final AuthService authService = AuthService();
  final UserNameService _userNameService = UserNameService();

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isTapped = false;
      });

      // // Close the drawer
      widget.scaffoldKey.currentState?.openEndDrawer();

      // Navigate to the new route
      if (_drawerItems[index].title == "Logout") {
        _showLogoutDialog(authService);
      } else {
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
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: SizedBox(
                            width: 80,
                            height: 80,
                            child: FutureBuilder(
                              future: _userNameService.fetchUserName(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SpinKitFadingCircle(
                                    color: AppColors.greenColor,
                                    size: 30,
                                  );
                                } else if (snapshot.hasError) {
                                  print(
                                      "DRAWER PROFILE IMAGE KA ERROR ${snapshot.error}");
                                  return Image.asset(
                                    ImageAssets
                                        .kmcLogoGrey, // Return a default image in case of error
                                    fit: BoxFit.contain,
                                  );
                                } else if (snapshot.hasData) {
                                  var userData = snapshot.data!;
                                  return Image.network(
                                    userData['profileImageUrl'],
                                    fit: BoxFit.cover,
                                  );
                                } else {
                                  return Image.asset(
                                    ImageAssets.kmcLogoGrey,
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    FutureBuilder(
                        future: _userNameService.fetchUserName(),
                        builder: ((context, snapshot) {
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return CircularProgressIndicator();
                          // } else
                          if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else if (snapshot.hasData) {
                            var userData = snapshot.data!;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome ${userData["firstName"]} ${userData["lastName"]} !",
                                  style: const TextStyle(
                                    color: AppColors.greenDarkColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.appFont,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                                child: Text(
                              '',
                              style: TextStyle(
                                color: AppColors.greenDarkColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.appFont,
                                fontSize: 16,
                              ),
                            ));
                          }
                        })),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 15),
                    //     child: Text(
                    //       'Welcome  !',
                    //       textAlign: TextAlign.left,
                    //       style: const TextStyle(
                    //         color: AppColors.whiteColor,
                    //         fontSize: 16,
                    //         fontFamily: AppFonts.appFont,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              ..._drawerItems.asMap().entries.map((entry) {
                int index = entry.key;
                _DrawerItem item = entry.value;
                return GestureDetector(
                  onTap: () {
                    _handleTap(index);
                  },
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

// Dialogue for Logout  Dialogue for Logout   Dialogue for Logout   Dialogue for Logout

void _showLogoutDialog(AuthService authService) {
  Get.dialog<String>(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                AppColors.blueColor,
                AppColors.whiteColor,
                AppColors.blueColor
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppColors.greenColorHomeScreen,
              ),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageAssets.logOutIcon,
                      width: 24,
                      height: 24,
                    ),
                    const Expanded(
                      child: Text(
                        "LOGOUT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppFonts.appFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Do you really want to Logout?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.greyDarksTextColor,
                fontFamily: AppFonts.appFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 130,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.greenDarkColor,
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                      child: const Center(
                        child: Text(
                          "Not now",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.appFont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await authService.logout();
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 130,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.greenColorHomeScreen,
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                      child: const Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.appFont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// Fuction to fetchUsername   Fuction to fetchUsername  Fuction to fetchUsername
class UserNameService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch user data function
  Future<Map<String, dynamic>?> fetchUserName() async {
    try {
      // Get the current user's UID
      String uid = _auth.currentUser!.uid;
      print('Fetched UID: $uid');

      // Fetch user document from Firestore
      DocumentSnapshot userDoc =
          await _firestore.collection('UserAccDetails').doc(uid).get();

      if (userDoc.exists) {
        // Return the data from the document
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
