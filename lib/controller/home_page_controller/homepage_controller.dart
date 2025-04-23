import 'package:get/get.dart';

class HomepageController extends GetxController {
  final List<String> countries = ['UAE', 'USA', 'PAK', 'IND'];
  var selectedCountry = 'UAE'.obs;

  void changeCountry(String country) {
    selectedCountry.value = country;
  }
}
