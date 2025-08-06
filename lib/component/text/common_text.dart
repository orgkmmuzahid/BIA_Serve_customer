import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    required this.text,
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.style,
    this.overflow,
    this.enableBorder = false,
    this.borderColor,
    this.borderRadious,
    this.backgroundColor,
    this.alignment,
    this.borderRadiusOnly,
    this.suffix,
    this.preffix,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final bool? enableBorder;
  final Color? borderColor;
  final double? borderRadious;
  final BorderRadius? borderRadiusOnly;
  final Color? backgroundColor;
  final MainAxisAlignment? alignment;
  final Widget? suffix;
  final Widget? preffix;

  @override
  Widget build(BuildContext context) {
    return enableBorder == true || backgroundColor != null ? _withBorder(context) : _withoutBorder(context);
  }

  EdgeInsets _edgeInsetsBuilder() => EdgeInsets.only(left: left.w, right: right.w, top: top.h, bottom: bottom.h);

  Widget _withBorder(BuildContext context) => Container(
    padding: _edgeInsetsBuilder(),
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: backgroundColor ?? getTheme.scaffoldBackgroundColor,
      border: Border.all(color: borderColor ?? Theme.of(context).dividerColor, width: 1.2.w),
      borderRadius: BorderRadius.circular(borderRadious?.r ?? 4.r),
    ),
    child: _textField(context),
  );

  Widget _withoutBorder(BuildContext context) => Padding(padding: _edgeInsetsBuilder(), child: _textField(context));

  WrapAlignment _convertAlignment() {
    switch (alignment) {
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.start:
      default:
        return WrapAlignment.start;
    }
  }

  Widget _textField(BuildContext context) {
    return Wrap(
      alignment: _convertAlignment(),
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: [
        if (preffix != null) preffix!,
        if (preffix != null) 10.width,
        Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: true,
          overflow: maxLines == null ? TextOverflow.visible : (overflow ?? TextOverflow.ellipsis),
          style:
              style ??
              GoogleFonts.dmSans(
                fontSize: fontSize.sp,
                fontWeight: fontWeight,
                color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
              ),
        ),
        if (suffix != null) 10.width,
        if (suffix != null) suffix!,
        if (suffix != null) 10.width,
      ],
    );
  }
}
