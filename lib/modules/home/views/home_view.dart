import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/service/my_drawer_header_service.dart';
import 'package:kmcapp/modules/home/viewModels/home_view_model.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import '../bindings/home_binding.dart';
import '../providers/weather_provider.dart';

int counter = 0;

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HomeBinding().dependencies();
    // Ensure HomeBinding is used

    // ignore: unused_local_variable
    final HomeViewModel viewModel = Get.find<HomeViewModel>();
    final WeatherProvider weatherProvider = Get.find<WeatherProvider>();

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          onPressed: () {
            // Add your action here
          },
          child: const Icon(Icons.add),
        ),
        appBar: CustomAppBar(
          title: "Home",
          onNotificationPressed: () {},
          badgeCount: counter,
        ),
        drawer: Drawer(
          child: Builder(
            builder: (BuildContext context) {
              return MyDrawerHeader(scaffoldKey: _scaffoldKey);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Image.asset(
                      "assets/images/Home_ViewPage_Image.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "378 AQI",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Karachi Metropolitan Corporation",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(() {
                                if (weatherProvider
                                    .weatherModel.value.location.isNotEmpty) {
                                  return Text(
                                      '${weatherProvider.weatherModel.value.temperature}\u00B0C',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ));
                                }
                                return const Text(
                                  "",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "KMC 311 APP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Obx(() {
                                if (weatherProvider
                                    .weatherModel.value.location.isNotEmpty) {
                                  return Text(
                                      weatherProvider
                                          .weatherModel.value.condition,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ));
                                }
                                return const Text(
                                  "",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: homeViewCarts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.toNamed(RouteName.kMCView);
                                break;

                              case 1:
                                Get.toNamed(RouteName.connectWithView);
                                break;

                              default:
                                Get.snackbar(
                                  "Error",
                                  "Screen not implemented yet",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                color: AppColors.greenColorHomeScreen
                                // color: const Color.fromARGB(255, 1, 123, 58),
                                ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // CircularProgressIndicator for icons
                                  FutureBuilder(
                                    future: Future.delayed(
                                        const Duration(seconds: 1)),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const SpinKitFadingCircle(
                                          color: AppColors.whiteColor,
                                          size: 40,
                                        );
                                      } else {
                                        return Image.asset(
                                          homeViewIcons[index],
                                          height: 40.0,
                                          width: 40.0,
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    homeViewCarts[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Data for grid items
  final List<String> homeViewCarts = [
    "KMC",
    "Connect With\nKMC",
    "Discarded Material",
    "All Citizen Services",
    "Quick Pay",
    "Complaints",
    "Helpline 24*7",
    "What's Near Me",
    "e_Hospital",
    "Pensioner Portal",
    "Important\nInformation",
    "Monitor Water\nQuality",
    "OPD Registration",
    "PTU Dashboard",
    "Garbage Vehicle\nTracking",
    "Employee Corner",
    "All Citizen Services",
    "Traffic And Parking",
    "Feedback",
    "City Rating",
    "3R Centers",
  ];

  final List<String> homeViewIcons = [
    ImageAssets.kmcWhiteIcon,
    ImageAssets.connectWithKMCIcon,
    ImageAssets.discardedMaterialIcon,
    ImageAssets.allCitizenServicesIcon,
    ImageAssets.quickPayIcon,
    ImageAssets.complaintIcon,
    ImageAssets.helpLineIcon,
    ImageAssets.whatsNearMeIcon,
    ImageAssets.eHospitalIcon,
    ImageAssets.pensionerPortalIcon,
    ImageAssets.importantInformationIcon,
    ImageAssets.monitorWaterQualityIcon,
    ImageAssets.opdRegisterationIcon,
    ImageAssets.ptuDashboardIcon,
    ImageAssets.garbageVehicleIcon,
    ImageAssets.employeeCornerIcon,
    ImageAssets.greenKarachi,
    ImageAssets.trafficAndParkingIcon,
    ImageAssets.feedbackHomeIcon,
    ImageAssets.cityRatingIcon,
    ImageAssets.rrrCenterIcon,
  ];
}
