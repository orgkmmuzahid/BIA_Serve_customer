import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/common_text.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
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
  });

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
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late bool _obscureText;

  bool get _hasController => widget.controller != null;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    // Set initial text only if the controller was provided
    if (widget.initialText != null) {
      _controller.text = widget.initialText ?? '';
    }

    _focusNode.addListener(() {
      setState(() {}); // rebuild to reflect focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (!_hasController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Color _iconColor() {
    return _focusNode.hasFocus
        ? (widget.borderColor ?? getTheme.primaryColor)
        : getTheme.colorScheme.outline;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        readOnly: widget.isReadOnly,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onSaved: widget.onSaved == null ? null : (v) => widget.onSaved!(v ?? ''),
        maxLength: widget.mexLength,
        inputFormatters: widget.inputFormatters,
        onFieldSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        validator: widget.validator,
        style: getTheme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
          filled: true,
          counterText: '',
          errorMaxLines: 2,
          prefixIcon:
              widget.prefixText?.isNotEmpty == true
                  ? Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 5,
                    ), // add some right padding to allow hint space
                    child: CommonText(
                      text: widget.prefixText!,
                      color: _iconColor(),
                    ),
                  )
                  : widget.prefixIcon,
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon:
              widget.isPassword ? _buildPasswordSuffixIcon() : widget.suffixIcon,
          prefixIconColor: _iconColor(),
          suffixIconColor: _iconColor(),
          enabledBorder:
              widget.borderColor != null
                  ? getTheme.inputDecorationTheme.enabledBorder?.copyWith(
                    borderSide:
                        getTheme.inputDecorationTheme.enabledBorder?.borderSide
                            .copyWith(color: widget.borderColor) ??
                        BorderSide(color: widget.borderColor!),
                  )
                  : getTheme.inputDecorationTheme.enabledBorder,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal.w,
            vertical: widget.paddingVertical.h,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
      ),
    );
  }

  Widget _buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 10.w),
        child: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20.sp,
        ),
      ),
    );
  }
}
