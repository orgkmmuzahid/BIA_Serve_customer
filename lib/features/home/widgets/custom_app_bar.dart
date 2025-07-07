import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String address;
  final MapEntry<String, String>? slectedCountry;
  final Map<String, String> availableCountries;
  final void Function(MapEntry<String, String> country) onCountryChange;
  final VoidCallback? onNotificationTap;
  final double iconSize = 24;
  final int notificationCount;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.address,
    required this.slectedCountry,
    required this.availableCountries,
    required this.onCountryChange,
    this.onNotificationTap,
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

      actions: [
        _buildNotificationIcon(notificationCount: notificationCount),
        12.width,
        _buildLanguageDropdown(),
        16.width
      ],
    );
  }

  Widget _buildNotificationIcon({
    required int notificationCount,
    double iconSize = 24,
    Color? iconColor,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          Icons.notifications_none,
          color: iconColor ?? Colors.black,
          size: iconSize,
        ),
        if (notificationCount > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                notificationCount > 99 ? '99+' : '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLanguageDropdown() {
    
    return DropdownButtonHideUnderline(
      child: DropdownButton2<MapEntry<String, String>>(
        value: slectedCountry,
        customButton: CommonImage(imageSrc: slectedCountry?.value ?? availableCountries.entries.first.value, size: 24,),
        items: [
          ...availableCountries.entries.map((country) {
            return DropdownMenuItem<MapEntry<String, String>>(
              value: country,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 118,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color:
                            theme
                                .inputDecorationTheme
                                .disabledBorder!
                                .borderSide
                                .color,
                      ),
                    ),
                    child: Row(children: [ 
                      CommonImage(imageSrc: country.value, size: 24, borderRadius: 24), 
                      10.width,
                      SizedBox(
                        child: CommonText(text: country.key, style: theme.textTheme.bodyLarge,))
                      ],)
                       
                  ),
                ],
              ),
            );
          }),
        ],
        onChanged: (MapEntry<String, String>? newCountry) {
          if (newCountry != null) {
            onCountryChange(newCountry);
          }
        },
        dropdownStyleData: DropdownStyleData(
          width: 150,
          maxHeight: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.scaffoldBackgroundColor,
          ),
          offset: const Offset(0, 0), // Optional spacing below the button
        ),
      ),
    );
  }
}
