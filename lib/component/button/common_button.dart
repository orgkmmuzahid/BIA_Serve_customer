import 'package:flutter/material.dart';
import '../other_widgets/common_loader.dart';
import '../text/common_text.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    required this.titleText,
    super.key,
    this.onTap,
    this.titleColor,
    this.buttonColor,
    this.titleSize = 14,
    this.buttonRadius = 10,
    this.alignment = MainAxisAlignment.center,
    this.titleWeight = FontWeight.w700,
    this.buttonHeight = 48,
    this.borderWidth = 1,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor,
    this.icon,
  });
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

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
      upperBound: 0.05,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = 1 - _animationController.value;

    return Transform.scale(
      scale: scale,
      child: Container(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(widget.buttonRadius),
          border: Border.all(
            color:
                widget.borderColor ??
                widget.buttonColor ??
                Theme.of(context).scaffoldBackgroundColor,
            width: widget.borderWidth,
          ),
        ),
        // Material with type: transparency to avoid any elevation/shadow
        child: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: Colors.transparent, // no splash
            highlightColor: Colors.transparent, // no highlight
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.buttonRadius),
            onTapDown: (_) => _animationController.forward(),
            onTapUp: (_) => _animationController.reverse(),
            onTapCancel: () => _animationController.reverse(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                child: Row(
                  mainAxisAlignment: widget.alignment,
                  children: [
                    if (widget.icon != null) ...[
                      widget.icon!,
                      const SizedBox(width: 6),
                    ],
                    widget.isLoading
                        ? CommonLoader(size: widget.buttonHeight - 12)
                        : CommonText(
                          text: widget.titleText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: widget.titleSize,
                          color:
                              widget.titleColor ??
                              Theme.of(context).colorScheme.onSecondary,
                          fontWeight: widget.titleWeight,
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
