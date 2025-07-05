import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.userName, required this.address});
  final String userName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: theme.primaryColor),
            child: Container(
              height: 146,
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    address,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  10.height,
                  CommonButton(
                    titleText: AppString.viewProfile,
                    buttonWidth: 90,
                    buttonHeight: 24,
                    titleSize: 10,
                    titleColor: theme.colorScheme.onPrimary,
                    titleWeight: FontWeight.w700,
                    buttonRadius: 4,
                    borderColor: theme.colorScheme.onPrimary,
                    buttonColor: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          // Drawer Items
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to another page if needed
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}
