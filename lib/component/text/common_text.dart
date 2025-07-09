import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color,
    required this.text,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.enableBorder = false,
    this.borderColor,
    this.borderRadius
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
  final int maxLines;
  final TextOverflow overflow;
  final TextStyle? style;
  final bool? enableBorder;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => enableBorder == true? withBorder() :  withoutBorder();
  

   EdgeInsets _edgInsetsBuilder() =>  EdgeInsets.only(
      left: left.w,
      right: right.w,
      top: top.h,
      bottom: bottom.h,
    );

  Widget withBorder()=> Container(
    padding: _edgInsetsBuilder(),
    decoration: BoxDecoration(borderRadius: borderRadius != null? BorderRadius.circular(borderRadius!): null,
     border: borderColor != null? _buildBorder(borderColor!): _buildBorder(theme.dividerColor)),
    child: Row(
      children: [
        _textFiled(),
      ],
    ),
  );

  BoxBorder? _buildBorder(Color color) {
    return BoxBorder.all(color: color);
  }

  Padding withoutBorder()=> Padding(
    padding: _edgInsetsBuilder(),
    child: _textFiled(),
  );
  

  Text _textFiled() {
    return Text(
    textAlign: textAlign,
    text,
    maxLines: maxLines,
    overflow: overflow,
    style:
        style ??
        GoogleFonts.dmSans(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color ?? theme.textTheme.bodyMedium!.color,
        ),
  );
  }
}
