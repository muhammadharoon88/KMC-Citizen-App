import 'package:flutter/material.dart';
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "FAQ",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: const SafeArea(
        child: FAQList(),
      ),
    );
  }
}

// Yahan Separate Class Banai Ha  // Yahan Separate Class Banai Ha
// Yahan Separate Class Banai Ha  // Yahan Separate Class Banai Ha

class FAQList extends StatefulWidget {
  const FAQList({super.key});

  @override
  FAQListState createState() => FAQListState();
}

class FAQListState extends State<FAQList> {
  final List<Map<String, String>> faqList = [
    {
      'question': 'What is KMC 311?',
      'answer':
          'KMC 311 is a mobile based citizen application, allowing citizens of Karachi have access to numerous public services like register a complaint regarding any of the civic issues, get traffic and parking information of the city, access Helpline 24x7, pay bills instantly, find nearby places such as public toilets, hospitals, schools and so on.'
    },
    {
      'question': 'Who can use KMC 311 application?',
      'answer':
          'All citizens of Karachi city can use KMC 311 application for accessing a range of public services that allows them to save a huge amount of their time.'
    },
    {
      'question': 'How does this Application work?',
      'answer':
          'In this application, you can see twenty-one different modules on which you need to click as per your requirement. After clicking on the main icon, you can choose any sub-module from the given list in order to get the required information, pay bills instantly and so on.'
    },
    {
      'question': 'Do I have to pay for this Application?',
      'answer':
          'No, KMC 311 is free for Citizens. KMC is not charging any cost for downloading this application.'
    },
    {
      'question': 'Do I have to register to use KMC 311?',
      'answer':
          'Yes, you need to register your self with KMC 311 to use this application. You can register it through sign-up option, or you can sign-in with you Google or Facebook account.'
    },
    {
      'question':
          'What kind of public services can be accessed in KMC 311 application?',
      'answer':
          'In KMC 311, you can have access to numerous public service like Help;line 24x7, register a complaint any of the civic issues, pay your electricity, water etc bill, find nearby toilets metro stations schools and so on. Moreover, you can access alll citizen services, get traffic and parking information of the city and also connect with KMC (Karachi Metropolitan Coorporation) departments.'
    },
    {
      'question': 'What is the privacy setting of the KMC 311 Application?',
      'answer':
          'The main concept of KMC-311 is to provide a platform, where citizens of Karachi can access a variety of services, being offered by KMC at one place, on single touch of their smart phones.'
    },
    {
      'question': 'Can I delete my account from KMC 311?',
      'answer':
          'Yes, you can delete your account anytime from KMC 311 application. To delete your account just uninstll it from you phone and send an E-mail to: mharoon.3421@gmail.com'
    },
  ];

  int? tappedIndex;
  Color defaultTileColor = Colors.white;
  Color tappedTileColor = AppColors.greenColor;

  // void _onTileTap(int index) {
  //   setState(() {
  //     tappedIndex = index;
  //   });

  //   Timer(const Duration(milliseconds: 150), () {
  //     setState(() {
  //       tappedIndex = null;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index) {
        bool isTapped = tappedIndex == index;
        return GestureDetector(
          // onTap: () => _onTileTap(index),
          child: Container(
            color: isTapped ? tappedTileColor : defaultTileColor,
            child: ExpansionTile(
              backgroundColor: isTapped ? tappedTileColor : defaultTileColor,
              onExpansionChanged: (bool expanded) {
                setState(() {
                  tappedIndex = expanded ? index : null;
                });
              },
              leading: Icon(
                Icons.help_center_rounded,
                color: isTapped ? Colors.white : AppColors.greenDarkColor,
              ),
              title: Text(
                faqList[index]['question']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isTapped ? Colors.white : AppColors.greenDarkColor,
                ),
              ),
              trailing: Icon(
                Icons.expand_more,
                color: isTapped ? Colors.white : AppColors.greenDarkColor,
              ),
              children: <Widget>[
                Container(
                  color: AppColors.greyTileColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 30, right: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.greenDarkColor,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            faqList[index]['answer']!,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
