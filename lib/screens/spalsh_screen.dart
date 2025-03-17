import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/screens/Country_Search_screen.dart';
import 'package:newsapp/customs/Custmo_Text.dart';
import 'package:newsapp/customs/CustomShaderMask.dart';
import 'package:newsapp/theme/Color_Theme.dart';
class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer((Duration(seconds: 2)), () {
      Get.to(()=>HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shadermasktheme(
                  lineargradiant: FirstColorTheme(),
                  widget: Icon(
                    Icons.menu_book_sharp,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                shadermasktheme(
                  lineargradiant: FirstColorTheme(),
                  widget: Row(
                    children: [
                      CustomText(
                        text: 'News',
                        fontsize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                      CustomText(
                        text: ' Cloud',
                        fontsize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            shadermasktheme(
              lineargradiant: SecColorTheme(),
              widget: Column(
                children: [
                  CustomText(
                    text: 'Breaking News, In-Depth Analysis',
                    fontsize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  CustomText(
                    text: ' 24/7 Updates.',
                    fontsize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
