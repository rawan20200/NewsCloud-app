import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/json/Json_Country.dart';

class Get_SearchingField extends GetxController {
  late RxMap<String, dynamic> CountryName = <String, String>{}.obs;
  late RxList<String> KeyList = CountryName.keys.toList().obs;
  late RxString country_id = ''.obs;
  late Rx<RxList<String>> filter = KeyList.obs;
  Rx<TextEditingController> TextController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;
  Rx<bool> countryselected = false.obs;
  RxString query = ''.obs;
  Get_SearchingField() {
    _loadCountries();
  }
  Future<void> _loadCountries() async {
    CountryName.value = await LoadCountries();
    KeyList.value = CountryName.keys.toList();
    filter.value = KeyList;
  }

  OnChanged(RxString value) {
    filter.value =
        KeyList.where(
          (item) => item.toLowerCase().startsWith(value),
        ).toList().obs;
  }

  onTap(int i) {
    TextController.value.text = filter.value[i];
    query.value = filter.value[i];
    country_id.value = CountryName[query.toString()]!;
    filter.value = <String>[].obs;
    countryselected.value = true;
  }

  OnButtonClear() {
    TextController.value.clear();
    filter.value = KeyList;
    countryselected.value = false;
  }

  onsubmitted(String value) {
    query.value = value;
    country_id.value = CountryName[query.value]!;
    countryselected.value = true;
    filter.value = <String>[].obs;
  }

  CountryIdSelected({required RxString countryName}) {
    country_id.value = CountryName[countryName.value]!;
  }
}
