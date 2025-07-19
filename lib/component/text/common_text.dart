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
    this.borderRadius,
    this.backgroundColor,
    this.alignment,
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
  final double? borderRadius;
  final Color? backgroundColor;
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return enableBorder == true || backgroundColor != null
        ? _withBorder(context)
        : _withoutBorder(context);
  }

  EdgeInsets _edgeInsetsBuilder() => EdgeInsets.only(
    left: left.w,
    right: right.w,
    top: top.h,
    bottom: bottom.h,
  );

  Widget _withBorder(BuildContext context) => Container(
    padding: _edgeInsetsBuilder(),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius:
          borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      border: Border.all(color: borderColor ?? Theme.of(context).dividerColor),
    ),
    child: Align(alignment: _convertAlignment(), child: _textField(context)),
  );

  Widget _withoutBorder(BuildContext context) => Padding(
    padding: _edgeInsetsBuilder(),
    child: Align(alignment: _convertAlignment(), child: _textField(context)),
  );

  Alignment _convertAlignment() {
    switch (alignment) {
      case MainAxisAlignment.center:
        return Alignment.center;
      case MainAxisAlignment.end:
        return Alignment.centerRight;
      case MainAxisAlignment.start:
      default:
        return Alignment.centerLeft;
    }
  }

  Widget _textField(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow:
          maxLines == null
              ? TextOverflow.visible
              : (overflow ?? TextOverflow.ellipsis),
      style:
          style ??
          GoogleFonts.dmSans(
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
          ),
    );
  }
}
