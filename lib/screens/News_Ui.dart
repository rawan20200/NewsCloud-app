import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';
import 'package:newsapp/GETX/Get_newscontroller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsUi extends StatefulWidget {
  const NewsUi({
    super.key,
    required this.country_id,
    required this.categoryname,
  });
  final String country_id;
  final String categoryname;

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  late GetNewsApi news;
  late Get_Newscontroller newscontroller;
  @override
  void initState() {
    super.initState();
    news = Get.put(GetNewsApi());
    newscontroller = Get.put(Get_Newscontroller());
    news.Get_News(country_id: widget.country_id, category: widget.categoryname);
  }

  @override
  Widget build(BuildContext context) {
    news.Get_News(country_id: widget.country_id, category: widget.categoryname);
    return Expanded(
      child: Obx(
        () =>
            news.isloading.value == true
                ? Center(
                  child: CircularProgressIndicator(color: Colors.blueAccent),
                )
                : ListView.builder(
                  itemCount: news.news_data.length,
                  itemBuilder:
                      (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(news.news_data[i].link_url),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          Icon(Icons.error),
                                  image: NetworkImage(
                                    news.news_data[i].image_url,
                                  ),
                                ),
                              ),
                            ),
                            //title
                            Text(
                              news.news_data[i].title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            //Description
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              news.news_data[i].description,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Container(
                              child: Divider(
                                color: Colors.blueAccent,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
      ),
    );
  }
}
