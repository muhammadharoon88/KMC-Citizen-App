// import 'package:flutter/material.dart';
// import 'package:kmcapp/modules/home/home_view.dart';

// class CheckBadgeTemp extends StatefulWidget {
//   const CheckBadgeTemp({super.key});

//   @override
//   State<CheckBadgeTemp> createState() => _CheckBadgeTempState();
// }

// class _CheckBadgeTempState extends State<CheckBadgeTemp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Temporary Checking'),
//         centerTitle: true,
//       ),
//       drawer: const Drawer_widget(),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     counter++;
//                   },
//                   child: Text("Add")),
//               ElevatedButton(
//                   onPressed: () {
//                     counter--;
//                   },
//                   child: Text("Subtract")),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomeView()));
//                   },
//                   child: Text("Back to HomePage")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Drawer_widget extends StatelessWidget {
//   const Drawer_widget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: const [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/darwer MQ image.jpg"),
//                   fit: BoxFit.cover),
//             ),
//             child: Column(
//               children: [
//                 Image(
//                   image: AssetImage("assets/images/kmc.png"),
//                   height: 100,
//                 ),
//                 Text("Welcom on KMC APP"),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Home"),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Profile"),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Frequently Ask Questions"),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Feedback"),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Logout"),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Change Language"),
//           ),
//           // ListView.builder(
//           //     itemCount: drawerItems.length,
//           //     itemBuilder: (context, index) {
//           //       return ListTile(
//           //         leading: Icon(drawerItems[index]['icon']),
//           //         title: Text(drawerItems[index]['text']),
//           //       );
//           //     })
//         ],
//       ),
//     );
//   }
// }
