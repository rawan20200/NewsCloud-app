import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
  });
  final String text;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.gentiumPlus(
        fontSize: fontsize,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }
}