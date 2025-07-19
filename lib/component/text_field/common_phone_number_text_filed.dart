import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field_v2/intl_phone_field.dart';
import 'package:intl_phone_field_v2/phone_number.dart';

class CommonPhoneNumberTextFiled extends StatelessWidget {
  const CommonPhoneNumberTextFiled({
    required this.controller,
    required this.countryChange,
    super.key,
  });

  final TextEditingController controller;
  final Function(PhoneNumber value) countryChange;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'SE',
      controller: controller,
      validator: OtherHelper.phoneValidator,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),

      decoration: InputDecoration(
        labelText: '',
        prefixIcon: Container(
          padding: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
      flagsButtonPadding: const EdgeInsets.only(left: 8, right: 8),
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      disableLengthCheck: true,
      textAlignVertical: TextAlignVertical.center,
      onChanged: countryChange,
    );
  }
}
