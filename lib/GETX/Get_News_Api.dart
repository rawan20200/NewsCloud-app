import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:newsapp/model/NewsModel.dart';

class GetNewsApi extends GetxController {
  var news_data = [].obs;
  RxBool isloading = false.obs;
  Get_News({required String country_id, required String category}) async {
    try {
      isloading.value = true;
      news_data.clear();
      var apikey = 'pub_746646328822f0f0468bb4284cb73248a2657';
      var baseURL = 'https://newsdata.io/api/1/latest';
      var url =
          '$baseURL?category=$category&apikey=$apikey&country=$country_id';
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        var data = responsebody['results'];
        for (int i = 0; i < data.length; i++) {
          News_Model newsModel = News_Model(
            title: data[i]['title'] ?? 'No Title',
            description: data[i]['description'] ?? 'No Description',
            image_url: data[i]['urlToImage'] ?? 'No Image',
            link_url: data[i]['url'],
          );
          news_data.add(newsModel);
        }

        isloading.value = false;
      } else {
        print('error');
      }
    } on Exception {
      print('Error Fetching News');
      isloading.value = false;
    }
  }
}
