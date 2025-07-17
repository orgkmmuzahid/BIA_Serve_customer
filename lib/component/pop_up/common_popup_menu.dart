import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonPopupMenu extends StatefulWidget {
  final List<String> items;
  final List<IconData>? icons;
  final void Function(String selectedItem) onItemSelected;
  final String? initialText;
  final TextStyle? textStyle;
  final bool showTextTrigger; // show main button with text
  final bool showIconTrigger; // show icon trigger
  final IconData triggerIcon;

  const CommonPopupMenu({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.icons,
    this.initialText,
    this.textStyle,
    this.showTextTrigger = true,
    this.showIconTrigger = false,
    this.triggerIcon = Icons.more_vert,
  }) : assert(icons == null || icons.length == items.length,
          'If icons are provided, they must match the length of items');

  @override
  State<CommonPopupMenu> createState() => _SelectablePopupMenuState();
}

class _SelectablePopupMenuState extends State<CommonPopupMenu> {
  String? selectedText;

  @override
  void initState() {
    super.initState();
    selectedText = widget.initialText ?? widget.items.first;
  }

  void _showPopupMenu(BuildContext context, GlobalKey key) async {
    final RenderBox button = key.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height,
        position.dx + button.size.width,
        position.dy,
      ),
      color: AppColors.serfeceBG,
      shadowColor: AppColors.disable,
      items: List.generate(widget.items.length, (index) {
        return PopupMenuItem<String>(
          value: widget.items[index],
          child: Row(
            children: [
              if (widget.icons != null) Icon(widget.icons![index], size: 18),
              if (widget.icons != null) const SizedBox(width: 8),
              Text(widget.items[index]),
            ],
          ),
        );
      }),
    );

    if (selected != null) {
      setState(() {
        selectedText = selected;
      });
      widget.onItemSelected(selected);
    }
  }

  final GlobalKey _textTriggerKey = GlobalKey();
  final GlobalKey _iconTriggerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showTextTrigger)
          GestureDetector(
            key: _textTriggerKey,
            onTap: () => _showPopupMenu(context, _textTriggerKey),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    selectedText ?? '',
                    style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        if (widget.showIconTrigger)
          IconButton(
            key: _iconTriggerKey,
            icon: Icon(widget.triggerIcon),
            onPressed: () => _showPopupMenu(context, _iconTriggerKey),
          ),
      ],
    );
  }
}
