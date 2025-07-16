import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonMultilineTextField extends StatelessWidget {
  const CommonMultilineTextField({
    super.key,
    required this.height,
    required this.onSave,
    this.validator, this.initialText, this.readOnly = false, this.hintText
  });

  final double height;
  final Function(String p1) onSave;
  final String? Function(String?)? validator;
  final String? initialText;
  final bool readOnly;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
height: height,
child: TextFormField(
  initialValue: initialText,
  
  onSaved: (newValue) {
    if(newValue != null && newValue.isNotEmpty){
      onSave(newValue);
    }
  } ,
  readOnly: readOnly,
  maxLines: null,
  style: theme.textTheme.bodyMedium,
  scrollPhysics: BouncingScrollPhysics(),
  validator: validator,
  expands: true, // expands to fill parent height
  decoration: InputDecoration(
    hintText: hintText,
    enabledBorder: OutlineInputBorder(borderSide: theme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(color: theme.dividerColor), borderRadius: BorderRadius.circular(10)),
    contentPadding: EdgeInsets.all(12),
  ),
),
);
  }
}