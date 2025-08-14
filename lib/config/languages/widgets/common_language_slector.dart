import 'package:bai_serve_customer/common/common_language_drop_down.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonLanguageSlector extends StatelessWidget {
  const CommonLanguageSlector({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<LanguageCubit, LanguageState>(
    builder:
        (context, state) => CommonLanguageDropDown(
          slectedCountry: state.selectedCountry,
          availableCountries: state.availableCountries,
          onCountryChange: (lang) {
            context.read<LanguageCubit>().changeLanguage(Language.values.firstWhere((e) => e.name == lang.key));
          },
        ),
  );
}
