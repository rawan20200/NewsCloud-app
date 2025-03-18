import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';
import 'package:newsapp/screens/Country_Search_screen.dart';
import 'package:newsapp/customs/category_view.dart';
import 'package:newsapp/customs/CustomPageView.dart';
import 'package:newsapp/GETX/Get_searchfield.dart';
import 'package:newsapp/GETX/Get_categorylist.dart';
import 'package:newsapp/GETX/Get_newscontroller.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late Get_Newscontroller newscontroller = Get.put(
    Get_Newscontroller(),
    permanent: true,
  );
  late Get_SearchingField searchingField = Get.put(
    Get_SearchingField(),
    permanent: true,
  );
  late Get_CategoryList category = Get.put(Get_CategoryList(), permanent: true);
  late final GetNewsApi news = Get.put(GetNewsApi());
  late RxString countryname = searchingField.query;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newscontroller.countryid.value =
          searchingField.CountryName[countryname.value];
      newscontroller.categoryName.value =
          category.Category_list[category.current_index.value];
    });
    news.Get_News(
      country_id: newscontroller.countryid.value,
      category: newscontroller.categoryName.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.delete<GetNewsApi>();
              Get.off(() => HomePage());
            },
            icon: Icon(Icons.search, size: 30),
          ),
          IconButton(
            onPressed: () {
              Get.delete<GetNewsApi>();
              setState(() {});
              news.Get_News(
                country_id: newscontroller.countryid.value,
                category: newscontroller.categoryName.value,
              );
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
        title: Row(
          children: [
            Icon(Icons.location_on_sharp, color: Colors.blueAccent),
            SizedBox(width: 3),
            Obx(
              () => Text(
                countryname.value,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            PopupMenuButton(
              icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
              itemBuilder: (context) {
                return List.generate(
                  searchingField.KeyList.length,
                  (i) => PopupMenuItem(
                    textStyle: TextStyle(fontWeight: FontWeight.w800),
                    onTap: () {
                      countryname.value = searchingField.KeyList[i];
                      newscontroller.countryid.value =
                          searchingField.CountryName[searchingField.KeyList[i]];
                      newscontroller.updateCountry(
                        Country_Id: newscontroller.countryid.value,
                      );
                    },
                    child: Text(searchingField.KeyList[i]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => CategoryView(
              pageController: category.pagecontroller,
              currentindex: category.current_index.value,
              categorylistname: category.Category_list,
              ontap: () {
                category.ontap(index: category.current_index.value);
                WidgetsBinding.instance.addPostFrameCallback((_) {});
              },
              CategoryName: newscontroller.categoryName.value,
            ),
          ),
          Obx(
            () => CustomPageView(
              OnPageChanged: category.onchanged,
              country_id: newscontroller.countryid.value,
              categoryList: category.Category_list,
              categoryname: newscontroller.categoryName.value,
            ),
          ),
        ],
      ),
    );
  }
}
