
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:flutter/material.dart';

class CommonDateInputTextField extends StatefulWidget {
  const CommonDateInputTextField({
    super.key,
    this.onSave,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 10,
  });
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Function(String date)? onSave;

  @override
  State<CommonDateInputTextField> createState() => _CommonDateInputTextFieldState();
}

class _CommonDateInputTextFieldState extends State<CommonDateInputTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _controller.text = '${picked.toLocal()}'.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: _controller,
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      borderRadius: widget.borderRadius,
      hintText: 'YYYY-MM-DD',
      onSaved: (value, _) {
        if (widget.onSave == null) return;
        widget.onSave!(value);
      },
      suffixIcon: GestureDetector(
        onTap: () {
          _openDatePicker(context);
        },
        child: const Icon(Icons.calendar_month_outlined),
      ),
      validationType: ValidationType.validateDate,
    );
  }
}
