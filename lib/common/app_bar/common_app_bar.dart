import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class  CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  final String? title;
  final Widget? titleWidget;
  final Function()? onBackPress;
  final Widget? leading;
  final List<Widget>? actions;

  const CommonAppBar({super.key, this.title, this.onBackPress, this.titleWidget, this.leading, this.actions});
 
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
                centerTitle: true,
                leading: leading ?? IconButton(onPressed: (){
                  if(onBackPress != null) onBackPress!();
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios_new_sharp)),
                actions: actions ?? _appBarActions(),
                title: titleWidget ?? CommonText(
                  text: title ?? '' ,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              );

          List<Widget> _appBarActions() =>  [
        GetBuilder<NotificationsController>(builder: (controller)=> GestureDetector(onTap: controller.onNotificationTap ,child: _buildNotificationIcon(notificationCount: controller.totalUnreadNotification))),
        12.width,
        GetBuilder<HomeController>(builder: (controller)=> _buildLanguageDropdown(slectedCountry: controller.selectedCountry, availableCountries: controller.availableCountries,
         onCountryChange: controller.onCountryChange)),
        16.width
      ];

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

  Widget _buildLanguageDropdown({  required MapEntry<String, String> slectedCountry,
  required Map<String, String> availableCountries,
  required void Function(MapEntry<String, String> country) onCountryChange}) {
    
    return DropdownButtonHideUnderline(
      child: DropdownButton2<MapEntry<String, String>>(
        customButton: CommonImage(imageSrc: slectedCountry.value, size: 24,),
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
        onChanged: (newCountry) {
          if(newCountry != null){
        
         onCountryChange(newCountry);
          
        }},
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
