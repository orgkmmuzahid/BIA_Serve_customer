import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';

class CommonDateInputTextField extends StatefulWidget {
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Function(String date)? onSave;

  const CommonDateInputTextField({
    super.key,
    this.onSave,
    this.fillColor = AppColors.serfeceBG,
    this.hintTextColor = AppColors.disable,
    this.labelTextColor = AppColors.disable,
    this.textColor = AppColors.primaryText,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 10,
  });

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) {
        if(widget.onSave!= null && newValue != null) {
          widget.onSave!(newValue);
        }
      },
      readOnly: false,
      controller: _controller,
      validator: OtherHelper.validateDate,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: widget.textColor,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal,
          vertical: widget.paddingVertical,
        ),
        fillColor: widget.fillColor,
        hintText: 'YYYY-MM-DD',
        hintStyle: TextStyle(color: widget.hintTextColor),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: Theme.of(context).inputDecorationTheme.activeIndicatorBorder?.color,
          ),
          onPressed: () => _openDatePicker(context),
        ),
      ),
    );
  }
}
