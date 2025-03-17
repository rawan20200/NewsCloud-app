import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Get_CategoryList extends GetxController {
  List<String> Category_list = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];
  final PageController pagecontroller = PageController();
  RxInt current_index = 0.obs;

  ontap({required int index}) {
    print('///////////$index');
    pagecontroller.animateToPage(
      index,
      duration: Duration.zero,
      curve: Curves.linear,
    );
  }

  onchanged(value) {
    current_index.value = value;
  }
}
