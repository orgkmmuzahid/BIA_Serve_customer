import 'package:flutter/material.dart';

class CommonPageLoading extends StatelessWidget {
  const CommonPageLoading({
    super.key,
    this.message,
    this.backgroundColor = Colors.white,
    this.indicatorColor,
    this.indicatorSize = 40.0,
  });

  final String? message;
  final Color backgroundColor;
  final Color? indicatorColor;
  final double indicatorSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor ?? theme.primaryColor),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
