import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTabBar extends StatefulWidget {
  const CommonTabBar({
    required this.tabs,
    required this.tabViews,
    super.key,
    this.selectedStyle,
    this.unselectedStyle,
    this.onTabChange,
    this.selectedTextStyle,
    this.spaceing = 8,
    this.unselectedTextStyle,
  });
  final List<String> tabs;
  final List<Widget> tabViews;

  final BoxDecoration? selectedStyle;
  final BoxDecoration? unselectedStyle;

  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Function(int index)? onTabChange;
  final double spaceing;

  @override
  State<CommonTabBar> createState() => _CommonTabBarState();
}

class _CommonTabBarState extends State<CommonTabBar> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        if (widget.onTabChange != null) {
          widget.onTabChange!(_controller.index);
        }
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = _controller.index;

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: List.generate(widget.tabs.length, (tabIndex) {
                final isSelected = index == tabIndex;

                final defaultSelectedStyle = BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                );

                final defaultUnselectedStyle = BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(8),
                );

                final defaultSelectedTextStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

                final defaultUnselectedTextStyle = const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                );

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateTo(tabIndex);
                      if (widget.onTabChange != null) {
                        widget.onTabChange!(tabIndex);
                      }
                    },
                    child: Container(
                      decoration:
                          isSelected
                              ? (widget.selectedStyle ?? defaultSelectedStyle)
                              : (widget.unselectedStyle ?? defaultUnselectedStyle),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: tabIndex < widget.tabs.length - 1 ? EdgeInsets.only(right: widget.spaceing) : null,
                      alignment: Alignment.center,
                      child: Text(
                        widget.tabs[tabIndex],
                        style:
                            isSelected
                                ? (widget.selectedTextStyle ?? defaultSelectedTextStyle)
                                : (widget.unselectedTextStyle ?? defaultUnselectedTextStyle),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
            child: Container(
              key: ValueKey<int>(index),
              child:
                  widget.tabViews.isNotEmpty
                      ? widget.tabViews[index >= widget.tabViews.length ? widget.tabViews.length - 1 : index]
                      : const SizedBox(), // fallback if no tabViews at all
            ),
          ),
        ),
      ],
    );
  }
}
