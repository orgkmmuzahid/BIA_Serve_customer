import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonMultilineTextField extends StatelessWidget {
  const CommonMultilineTextField({
    required this.height,
    required this.onSave,
    required this.validationType,
    super.key,
    this.initialText,
    this.readOnly = false,
    this.hintText,
  });

  final double height;
  final Function(String p1) onSave;
  final ValidationType validationType;
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
          if (newValue != null && newValue.isNotEmpty) {
            onSave(newValue);
          }
        },
        readOnly: readOnly,
        maxLines: null,
        style: getTheme.textTheme.bodyMedium,
        scrollPhysics: const BouncingScrollPhysics(),
        validator: (value) => InputHelper.validate(validationType, value),
        inputFormatters: InputHelper.getInputFormatters(validationType),
        keyboardType: InputHelper.getKeyboardType(validationType),
        expands: true, // expands to fill parent height
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(color: getTheme.dividerColor),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
