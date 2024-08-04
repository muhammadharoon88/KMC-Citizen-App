// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/services.dart';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;
// import 'package:kmcapp/home/Widgets/my_drawer_header.dart';

// int counter = 0;

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final List<Map<String, dynamic>> drawerItems = [
//     {'title': 'Home', 'icon': Icons.home, 'route': '/home'},
//     {'title': 'Profile', 'icon': Icons.person, 'route': '/profile'},
//     {'title': 'Frequently Ask Ques.', 'icon': Icons.logout, 'route': '/logout'},
//     {'title': 'Feedback', 'icon': Icons.logout, 'route': '/logout'},
//     {'title': 'Logout', 'icon': Icons.logout, 'route': '/logout'},
//     {'title': 'Change Language', 'icon': Icons.logout, 'route': '/logout'},
//   ];

//   var homeViewCarts = [
//     "KMC",
//     "Connect With\n       KMC",
//     "Discarded Material",
//     "Smart Meter",
//     "Quick Pay",
//     "Complaints",
//     "Helpline 24*7",
//     "Startups",
//     "What's Near Me",
//     "e_Hospital",
//     "Pensioner Portal",
//     "e_Waste",
//     "Importanat \nInformation",
//     "Monitor Water\n     Quality",
//     "OPD Registration",
//     "PTU Dashboard",
//     "Garbage Vehicle\n       Tracking",
//     "Employee Corner",
//     "All Citizen Services",
//     "Traffic And Parking",
//     "Tree in KMC",
//   ];

//   Future getTemp() async {
//     var url = Uri.https("api.weatherapi.com", "/v1/current.json",
//         {'key': '0066aba3b2e7445bb79105922241301', 'q': 'karachi'});
//     var response = await http.get(url);
//     var responseBody = jsonDecode(response.body);
//     print(responseBody);
//     return responseBody;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: true,
//       onPopInvoked: (didPop) {
//         SystemNavigator.pop();
//       },
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.red,
//           onPressed: () {},
//           child: const Icon(Icons.add),
//         ),
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.white),
//           backgroundColor: Colors.grey,
//           title: const Text(
//             "Home",
//             style: TextStyle(color: Colors.white),
//           ),
//           systemOverlayStyle:
//               SystemUiOverlayStyle.light, // Ensure status bar icons are light

//           actions: [
//             badges.Badge(
//               badgeContent: Text(
//                 counter.toString(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//               position: badges.BadgePosition.custom(
//                 top: 0.01,
//               ),
//               showBadge: counter < 0 ? false : true,
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.notifications,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//         drawer: const Drawer(
//           child: MyDrawerHeader(),
//         ),

//         //  Body  Body    Body  Body  Body  Body  Body
//         body: SafeArea(
//           child: Container(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: 180,
//                       child: Image.asset(
//                         // Mazar e Qauid Image
//                         "assets/images/Home_ViewPage_Image.jpg",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   "378 AQI",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const Text("Karachi Metropolitan Corporation",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     )),
//                                 FutureBuilder(
//                                   future: getTemp(),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       print(snapshot.data);
//                                       return Text(
//                                           '${snapshot.data["current"]["temp_c"]}\u00B0C',
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ));
//                                     }
//                                     return const Text("N/A");
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   "KMC 311 APP",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 FutureBuilder(
//                                   future: getTemp(),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return Text(
//                                           snapshot.data['current']['condition']
//                                               ['text'],
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ));
//                                     }
//                                     return const Text("N/A");
//                                   },
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GridView.builder(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           // childAspectRatio: 0.9,
//                         ),
//                         itemCount: homeViewCarts.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.blue,
//                                 width: 2.0,
//                               ),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.blue,
//                                     // spreadRadius: 2.0,
//                                     blurRadius: 2.0,
//                                     offset: Offset(0, 0))
//                               ],
//                               color: const Color.fromARGB(255, 1, 123, 58),
//                             ),
//                             height: 80,
//                             child: Center(
//                                 child: Text(
//                               homeViewCarts[index],
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12,
//                               ),
//                             )),
//                           );
//                         }),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
