import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CommonLanguageDropDown extends StatelessWidget {
  const CommonLanguageDropDown({
    required this.slectedCountry,
    required this.availableCountries,
    required this.onCountryChange,
    super.key,
  });

  final MapEntry<String, String> slectedCountry;
  final Map<String, String> availableCountries;
  final void Function(MapEntry<String, String> country) onCountryChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<MapEntry<String, String>>(
        customButton: CommonImage(imageSrc: slectedCountry.value, size: 24),
        items: [
          ...availableCountries.entries.map((country) {
            return DropdownMenuItem<MapEntry<String, String>>(
              value: country,
              child: Row(
                children: [
                  Container(
                    width: 118,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color:
                            theme
                                .inputDecorationTheme
                                .disabledBorder!
                                .borderSide
                                .color,
                      ),
                    ),
                    child: Row(
                      children: [
                        CommonImage(
                          imageSrc: country.value,
                          size: 24,
                          borderRadius: 24,
                        ),
                        10.width,
                        SizedBox(
                          child: CommonText(
                            text: country.key,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
        onChanged: (newCountry) {
          if (newCountry != null) {
            onCountryChange(newCountry);
          }
        },
        dropdownStyleData: DropdownStyleData(
          width: 150,
          maxHeight: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
