import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsUi extends StatelessWidget {
  NewsUi({super.key, required this.country_id, required this.categoryname});
  final String country_id;
  final String categoryname;

  late GetNewsApi news = Get.put(GetNewsApi());

  @override
  Widget build(BuildContext context) {
    news.Get_News(country_id: country_id, category: categoryname);
    return FutureBuilder(
      future: news.Get_News(country_id: country_id, category: categoryname),
      builder: (context, snapshot) {
       
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:
                  (context, i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(snapshot.data[i]['link']));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image(
                              errorBuilder:
                                  (context, error, stackTrace) => Image(
                                    image: AssetImage(
                                      'assets/images/Image-not-found.png',
                                    ),
                                  ),
                              image: NetworkImage(
                                snapshot.data[i]['image_url'] ?? 'no image',
                              ),
                            ),
                          ),
                        ),
                        //title
                        Text(
                          snapshot.data[i]['title'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //Description
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          snapshot.data[i]['description'] ?? 'No description',
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
          );
        }
        return Text('');
      },
    );
  }
}
