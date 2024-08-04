import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  List faqAnswers = [
    "KMC 311 is amobile based citizen application, allowing citizens of Karachi have accesss to mumerous services like register complaint regarding any civic issue, get traffic and parking information of the city, access Helpline 24x7, pay bills instantly, finf nearby places such as public toilets, hospitals, schools and so on "
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              ImageAssets.questionMarkIcon,
              width: 16,
              height: 16,
            ),
            title: const Text("What is KMC 311"),
            trailing: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.greenDarkColor,
            ),
          ),
          ListView.builder(
            itemCount: faqAnswers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_right),
                    Text(faqAnswers[index]),
                  ],
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
