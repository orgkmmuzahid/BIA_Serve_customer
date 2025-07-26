import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonDropDown<T> extends StatelessWidget {
  const CommonDropDown({
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.nameBuilder,
    this.validator,
    this.borderColor,
    this.initailItem,
    this.isLoading = false,
    super.key,
  });

  final String hint;
  final List<T> items;
  final Color? borderColor;
  final Function(T? value) onChanged;
  final String Function(T value) nameBuilder;
  final String? Function(String? value)? validator;
  final T? initailItem;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<T>(
          validator: (value) => (validator == null || value == null) ? null : validator!(nameBuilder(value)),
          value: initailItem,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, right: 2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: getTheme.dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    borderColor ??
                    getTheme.inputDecorationTheme.enabledBorder?.borderSide.color ??
                    getTheme.disabledColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          hint: CommonText(text: hint),
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: AppColors.serfeceBG,
          isExpanded: true,
          items:
              items
                  .map((item) => DropdownMenuItem<T>(value: item, child: CommonText(text: nameBuilder(item))))
                  .toList(),
          onChanged: onChanged,
        ),
        if (isLoading) ...[
          const SizedBox(height: 4),
          const Padding(padding: EdgeInsets.only(left: 10, right: 10), child: LinearProgressIndicator(minHeight: 1)),
        ],
      ],
    );
  }
}
