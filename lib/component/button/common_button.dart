import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../other_widgets/common_loader.dart';
import '../text/common_text.dart';

class CommonButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String titleText;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoading;
  final Widget? icon;
  final MainAxisAlignment alignment;

  const CommonButton({
    this.onTap,
    required this.titleText,
    this.titleColor,
    this.buttonColor,
    this.titleSize = 16,
    this.buttonRadius = 10,
    this.alignment = MainAxisAlignment.center,
    this.titleWeight = FontWeight.w700,
    this.buttonHeight = 48,
    this.borderWidth = 1,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor,
    this.icon,
    super.key,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.15,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: widget.buttonWidth,
      child: _buildElevatedButton(),
    );
  }

  // Function to build the button with common settings
  Widget _buildElevatedButton() {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: (1 - _animationController.value).toDouble(),
        child: ElevatedButton(
          onPressed: null,
          style: _buttonStyle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: widget.alignment,
            children: [
              if (widget.icon != null) widget.icon!,

              widget.isLoading ? _buildLoader() : _buildText(),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(widget.buttonColor ?? theme.primaryColor),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.buttonRadius),
          side: BorderSide(
            color: widget.borderColor ?? widget.buttonColor ?? theme.scaffoldBackgroundColor,
            width: widget.borderWidth,
          ),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
    );
  }

  Widget _buildLoader() {
    return CommonLoader(size: widget.buttonHeight - 12);
  }

  Widget _buildText() {
    return CommonText(
      text: widget.titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      fontSize: widget.titleSize,
      color: widget.titleColor ?? theme.colorScheme.onSecondary,
      fontWeight: widget.titleWeight,
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap == null) return;
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }

  void _onTapCancel() {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }
}
