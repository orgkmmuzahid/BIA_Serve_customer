import 'dart:io';

import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


final _formKey = GlobalKey<FormState>();

class BulkOrderScreen extends StatelessWidget {
  const BulkOrderScreen({super.key});


  @override
  Widget build(BuildContext context) => GetBuilder<BulkOrderController>(
       builder: (bulkOrderController) {
         return Scaffold(appBar: 
  AppBar(
    title: Text(AppString.homeBulkOrderAgents), leading: GestureDetector(
      onTap: bulkOrderController.onBackPress,
      child: Icon(Icons.arrow_back),),), 
   body: Form(
    key: _formKey,
     child: Padding(padding: EdgeInsets.only(left: 16, right: 16), 
       child: Column(children: [
              CommonText(text: AppString.listOfSupplier, style: theme.textTheme.bodyLarge).start,
                
                ...List.generate(bulkOrderController.productItemDetails.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CommonTextField(
                      hintText: AppString.itemDetails,
                      borderColor: theme.dividerColor,
                      validator: OtherHelper.requiredFieldValidator,
                      onSaved: (value){
                      var item =  bulkOrderController.productItemDetails.entries.elementAt(index);
                      bulkOrderController.onItemDetailsChange( item.key, value);
                    }),
                  );
                }),
     
                CommonButton(titleText: AppString.addProduct, buttonWidth: 200, onTap: () {
                  bulkOrderController.increaseItemField();
                },),
                20.height,
               //image picker
                   GestureDetector(
                     onTap: () {
                       bulkOrderController.pickImage();
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
                      child: Row(children: List.generate(bulkOrderController.selectedImagesPath.length, (index){
                      return Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.only(left: 12),
                        child: Image.file(
                          width: 80, height: 80,
                          File(bulkOrderController.selectedImagesPath.elementAt(index))),
                      );
                    }),)),
     
                    20.height,
     
                    CommonButton(titleText: AppString.continues, onTap: (){
                      _formKey.currentState?.save();
                      bulkOrderController.continueToAddress();
                    },),
                    
           ],)
         
       ),
   ),);}
  );
}