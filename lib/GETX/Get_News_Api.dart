import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';

class GetNewsApi extends GetxController {
  Future Get_News({
    required String country_id,
    required String category,
  }) async {
    var apikey = 'pub_746646328822f0f0468bb4284cb73248a2657';
    var baseURL = 'https://newsdata.io/api/1/latest';
    var url =
        '$baseURL?apikey=$apikey&category=$category&country=$country_id';
    var response = await get(Uri.parse(url));
    var responsebody = jsonDecode(utf8.decode(response.bodyBytes));
    return responsebody['results'];
  }
}
