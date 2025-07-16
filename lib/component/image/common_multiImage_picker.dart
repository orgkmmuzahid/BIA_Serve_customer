import 'dart:io';

import 'package:bai_serve/component/image/common_multiImage_picker_controller.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CommonMultiimagePicker extends StatelessWidget {
  const CommonMultiimagePicker({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<CommonMultiimagePickerController>(builder: (controller){
    return Column(children: [
         GestureDetector(
               onTap: () {
                 controller.pickImage();
               },
               child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: theme.colorScheme.surfaceContainerLowest),
                height: 150, child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Icon(Icons.add), CommonText(text: AppString.addImage)],))),
             ),
              20.height,

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: List.generate(controller.selectedImagesPath.length, (index){
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(left: 12),
                  child: Image.file(
                    width: 80, height: 80,
                    File(controller.selectedImagesPath.elementAt(index))),
                );
              }),)),
    ]);
  });


}