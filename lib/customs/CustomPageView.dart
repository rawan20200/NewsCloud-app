import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';
import 'package:newsapp/screens/News_Ui.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({
    super.key,
    required this.OnPageChanged,
    required this.country_id,
    required this.categoryList,
    required this.categoryname,
  });
  final ValueChanged<int>? OnPageChanged;
  late List categoryList;
  final String country_id;
  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: OnPageChanged,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          Get.delete<GetNewsApi>();
          return NewsUi(
            country_id: country_id,
            categoryname: categoryList[index],
          );
        },
      ),
    );
  }
}
