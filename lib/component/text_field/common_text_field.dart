import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../text/common_text.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.mexLength,
    this.validator,
    this.prefixText,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 10,
    this.inputFormatters,
    this.onSaved,

    this.borderColor,
    this.onSubmitted,
    this.onTap,
    this.suffixIcon,
    this.isReadOnly = false,
    this.initialText,
  }) {
    if (isPassword) toggle();
  }
  final Function(String value)? onSaved;
  final String? initialText;
  final bool isReadOnly;
  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Color? borderColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? mexLength;
  final bool isPassword;
  RxBool obscureText = false.obs;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        readOnly: isReadOnly,
        initialValue: initialText,
        autovalidateMode: AutovalidateMode.onUnfocus,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText.value,
        textInputAction: textInputAction,
        onSaved: onSaved == null? null:  (value){
          onSaved!(value ?? '');
        } ,
        maxLength: mexLength,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onSubmitted,
        onTap: onTap,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: borderColor != null? theme.inputDecorationTheme.enabledBorder?.copyWith(borderSide: theme.inputDecorationTheme.enabledBorder?.borderSide.copyWith(color: borderColor)) : theme.inputDecorationTheme.enabledBorder,
          errorMaxLines: 2,
          filled: true,
          prefixIcon: prefixIcon,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal.w,
            vertical: paddingVertical.h,
          ),

          hintText: hintText,
          labelText: labelText,
          prefix: CommonText(
            text: prefixText ?? "",
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: isPassword ? _buildPasswordSuffixIcon() : suffixIcon,
        ),
      );
    });
  }

  Widget _buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: toggle,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 10.w),
        child: Icon(
          obscureText.value
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20.sp,
          color: theme.colorScheme.outline,
        ),
      ),
    );
  }

  void toggle() {
    obscureText.value = !obscureText.value;
  }
}
