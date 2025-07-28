import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';

class CommonDropDown<T> extends StatefulWidget {
  const CommonDropDown({
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.nameBuilder,
    this.validator,
    this.borderColor,
    this.isLoading = false,
    super.key,
  });

  final String hint;
  final List<T> items;
  final Color? borderColor;
  final Function(T? value) onChanged;
  final String Function(T value) nameBuilder;
  final String? Function(String? value)? validator;
  final bool isLoading;

  @override
  State<CommonDropDown<T>> createState() => _CommonDropDownState<T>();
}

class _CommonDropDownState<T> extends State<CommonDropDown<T>> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  T? _selectedItem;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();

    AppLogger.debug(widget.items.length.toString(), tag: 'common drop down');
    // Set first item by default if items are available
    if (widget.items.isNotEmpty) {
      _selectedItem = widget.items.first;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged(_selectedItem);
      });
    }
  }

  @override
  void didUpdateWidget(covariant CommonDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update selection when new items come in and none selected
    if (_selectedItem == null && widget.items.isNotEmpty) {
      _selectedItem = widget.items.first;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged(_selectedItem);
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isLoading ? AppColors.primaryColor : widget.borderColor ?? AppColors.disable;

    return Stack(
      alignment: Alignment.center,
      children: [
        DropdownButtonFormField<T>(
          validator:
              (value) =>
                  (widget.validator == null || value == null) ? null : widget.validator!(widget.nameBuilder(value)),
          value: _selectedItem,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, right: 2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: getTheme.dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          hint: CommonText(text: widget.hint),
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: AppColors.serfeceBG,
          isExpanded: true,
          items:
              widget.items
                  .map((item) => DropdownMenuItem<T>(value: item, child: CommonText(text: widget.nameBuilder(item))))
                  .toList(),
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
            widget.onChanged(value);
          },
        ),

        // Animated border while loading
        if (widget.isLoading)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(painter: _BorderLoaderPainter(_controller.value, borderColor));
              },
            ),
          ),
      ],
    );
  }
}

class _BorderLoaderPainter extends CustomPainter {
  _BorderLoaderPainter(this.progress, this.color);
  final double progress; // 0.0 to 1.0
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final path = Path()..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)));

    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final dashWidth = 50.0;
    final dashSpace = 1.0;
    final totalLength = (dashWidth + dashSpace);
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = progress * metric.length;

      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += totalLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BorderLoaderPainter oldDelegate) => oldDelegate.progress != progress;
}
