import 'package:get/get.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';

class Get_Newscontroller extends GetxController {
  RxString countryid = ''.obs;
  RxString categoryName = ''.obs;
  late GetNewsApi newsApi = Get.put(GetNewsApi());
  @override
  void onInit() {
    super.onInit();
    ever(countryid, (newCountryid) {
      Get.delete<GetNewsApi>();
      newsApi.Get_News(country_id: newCountryid, category: categoryName.value);
    });
    ever(categoryName, (newCategoryname) {
      Get.delete<GetNewsApi>();
      newsApi.Get_News(country_id: countryid.value, category: newCategoryname);
    });
  }

  void updateCountry({required String Country_Id}) {
    countryid.value = Country_Id;
  }

  void updatecategory({required String category}) {
    categoryName.value = category;
  }

  // void updatecategory({required String category}) {
  //   categoryName.value = category;
  //   update();
  // }
}
