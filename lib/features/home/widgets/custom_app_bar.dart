
import 'package:bai_serve/component/app_bar_actions.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String address;
  final MapEntry<String, String> slectedCountry;
  final Map<String, String> availableCountries;
  final void Function(MapEntry<String, String> country) onCountryChange;
  final Function() onNotificationTap;
  final double iconSize = 24;
  final int notificationCount;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.address,
    required this.slectedCountry,
    required this.availableCountries,
    required this.onCountryChange,
    required this.onNotificationTap,
    this.notificationCount = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,

      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu, color: theme.textTheme.bodyMedium?.color),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),

      // 👤 User info
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(address, style: theme.textTheme.bodySmall),
        ],
      ),

      actions: AppBarActions(notificationCount: notificationCount, slectedCountry: slectedCountry, availableCountries: availableCountries, onCountryChange: onCountryChange, onNotificationTap: onNotificationTap)
    );
  }

  
}
