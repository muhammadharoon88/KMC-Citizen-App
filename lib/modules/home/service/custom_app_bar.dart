import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/services.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int badgeCount;
  final VoidCallback onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.badgeCount = 0,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppColors.greyColorforAppBar,
      title: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actions: [
        badges.Badge(
          badgeContent: Text(
            badgeCount.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          position: badges.BadgePosition.custom(
            top: 0.01,
          ),
          showBadge: badgeCount < 0 ? false : true,
          child: IconButton(
            onPressed: onNotificationPressed,
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
