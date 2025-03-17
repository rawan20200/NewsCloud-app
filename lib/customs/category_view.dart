import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  CategoryView({
    super.key,
    required this.categorylistname,
    required this.pageController,
    required this.currentindex,
    required this.ontap,
    required this.CategoryName,
  });
  final PageController pageController;
  final int currentindex;
  final List<String> categorylistname;
  final VoidCallback ontap;
  String CategoryName;

  double GetTextWidth({required String text, required TextStyle textstyle}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textstyle),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }

  final TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorylistname.length,
        itemBuilder: (BuildContext context, int i) {
          CategoryName = categorylistname[currentindex];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categorylistname[i],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: currentindex == i ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ontap,
                child: Container(
                  width: GetTextWidth(
                    text: categorylistname[i],
                    textstyle: textStyle,
                  ),
                  height: 2,
                  color:
                      currentindex == i
                          ? Colors.blueAccent
                          : Colors.transparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
