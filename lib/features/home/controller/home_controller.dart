import 'package:get/get.dart';
import 'package:intl_phone_field_v2/countries.dart';

class HomeController extends GetxController {
  String name = "Shakir Ahmed";
  String address = "1901 Thornridge Cir. Shiloh, Hawaii 81063";
  int notificationCount = 1;
  Country selectedCountry = countries.firstWhere(
    (country) => "United Kingdom".startsWith(country.name),
  );

  List<Country> availableCountries = [
    countries.firstWhere(
      (country) => "United Kingdom".startsWith(country.name),
    ),

    countries.firstWhere((country) => "Sweden".startsWith(country.name)),
  ];

  void onCountryChange(Country country) {
    selectedCountry = country;
    update();
  }
}
