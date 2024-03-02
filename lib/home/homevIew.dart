import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

int counter = 0;
List drawerElements = [
  "Home",
  "Profile",
  "Frequently Ask Ques",
  "Feedback",
  "Logout",
  "Change Language"
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Home', 'icon': Icons.home, 'route': '/home'},
    {'title': 'Profile', 'icon': Icons.person, 'route': '/profile'},
    {'title': 'Frequently Ask Ques.', 'icon': Icons.logout, 'route': '/logout'},
    {'title': 'Feedback', 'icon': Icons.logout, 'route': '/logout'},
    {'title': 'Logout', 'icon': Icons.logout, 'route': '/logout'},
    {'title': 'Change Language', 'icon': Icons.logout, 'route': '/logout'},
  ];

  var homeViewCarts = [
    "KMC",
    "Connect With\n       KMC",
    "Discarded Material",
    "Smart Meter",
    "Quick Pay",
    "Complaints",
    "Helpline 24*7",
    "Startups",
    "What's Near Me",
    "e_Hospital",
    "Pensioner Portal",
    "e_Waste",
    "Importanat \nInformation",
    "Monitor Water\n     Quality",
    "OPD Registration",
    "PTU Dashboard",
    "Garbage Vehicle\n       Tracking",
    "Employee Corner",
    "All Citizen Services",
    "Traffic And Parking",
    "Tree in KMC",
  ];

  Future getTemp() async {
    var url = Uri.https("api.weatherapi.com", "/v1/current.json",
        {'key': '0066aba3b2e7445bb79105922241301', 'q': 'karachi'});
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    print(responseBody);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          badges.Badge(
            badgeContent: Text(
              counter.toString(),
              style: TextStyle(color: Colors.white),
            ),
            position: badges.BadgePosition.custom(
              top: 0.01,
            ),
            showBadge: counter < 0 ? false : true,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer_widget(),

      //  Body  Body    Body  Body  Body  Body  Body
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Image.asset(
                    // Mazar e Qauid Image
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
                            Text(
                              "378 AQI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Karachi Metropolitan Corporation",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            FutureBuilder(
                              future: getTemp(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print(snapshot.data);
                                  return Text(
                                      '${snapshot.data["current"]["temp_c"]}\u00B0C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ));
                                }
                                return Text("N/A");
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "KMC 311 APP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            FutureBuilder(
                              future: getTemp(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      snapshot.data['current']['condition']
                                          ['text'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ));
                                }
                                return Text("N/A");
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      // childAspectRatio: 0.9,
                    ),
                    itemCount: homeViewCarts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue,
                                // spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 0))
                          ],
                          color: Color.fromARGB(255, 1, 123, 58),
                        ),
                        height: 80,
                        child: Center(
                            child: Text(
                          homeViewCarts[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Drawer_widget extends StatelessWidget {
  const Drawer_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/darwer MQ image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/kmc.png"),
                  height: 100,
                ),
                Text("Welcom on KMC APP"),
              ],
            ),
          ),

          for (int i = 0; i < drawerElements.length; i++) ...[
            ListTile(
              leading: Icon(drawerElements[i]['icon']),
              title: Text(drawerElements[i]['title']),
              onTap: () {
                // Handle onTap for each ListTile
                Navigator.pop(context); // Close the drawer
                // handleDrawerItemClick(drawerElements[i], context);
                // Navigate to the corresponding route
                Navigator.pushNamed(context, drawerElements[i]['route']);
              },
            )
          ]

          // for (int i = 0; i < drawerElements.length; i++) ...[
          //   ListTile(
          //     leading: Icon(drawerElements[i]['icon']),
          //     title: Text(drawerElements[i]['title']),
          //     onTap: () {
          //       // Handle onTap for each ListTile
          //       Navigator.pop(context); // Close the drawer
          //       // handleDrawerItemClick(drawerElements[i], context);
          //       // Navigate to the corresponding route
          //       Navigator.pushNamed(context, drawerElements[i]['route']);
          //     },
          //   ),
          //   if (i < drawerElements.length)
          //     Divider(), // Add divider for all but the last item
          // ],
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Home",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Profile",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Frequently Asked Ques.",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Feedback",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Logout",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Colors.grey))),
          //   child: ListTile(
          //     dense: true,
          //     leading: Icon(Icons.home),
          //     title: Text(
          //       "Change Language",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 1, 123, 58),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 18),
          //     ),
          //   ),
          // ),
          // ListView.builder(
          //     itemCount: drawerElements.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         width: double.infinity,
          //         height: 10,
          //         child: ListTile(
          //           leading: Icon(Icons.home),
          //           title: Text(drawerElements[index]),
          //         ),
          //       );
          //     })
        ],
      ),
    );
  }
}

// void handleDrawerItemClick(String item, BuildContext context) {
//   // Implement your logic based on the selected drawer item
//   switch (item) {
//     case 'Home':
//       // Handle Home item click
//       break;
//     case 'Profile':
//       // Handle Profile item click
//       break;
//     case 'Frequently Ask Ques':
//       // Handle Frequently Ask Ques item click
//       break;
//     case 'Feedback':
//       // Handle Feedback item click
//       break;
//     case 'Logout':
//       // Handle Logout item click
//       break;
//     case 'Change Language':
//       // Handle Change Language item click
//       break;
//   }
// }
