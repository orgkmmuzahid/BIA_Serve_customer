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
    super.key,
    this.validator,
    this.initailItem,
  });

  final String hint;
  final List<T> items;
  final Function(T? value) onChanged;
  final String Function(T value) nameBuilder;
  final String? Function(String? value)? validator;
  final T? initailItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator:
          (value) =>
              (validator == null || value == null)
                  ? null
                  : validator!(nameBuilder(value)),
      value: this.initailItem,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      hint: CommonText(text: hint),
      icon: const Icon(Icons.arrow_drop_down),
      dropdownColor: AppColors.serfeceBG,
      isExpanded: true,
      items:
          items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: CommonText(text: nameBuilder(item)),
            );
          }).toList(),
      onChanged: onChanged,
    );
  }
}
