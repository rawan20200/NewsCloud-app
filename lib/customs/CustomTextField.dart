import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.TextController,
    required this.OnChanged,

    required this.OnButtonPressed,
    required this.onsubmitted,
  });
  final TextEditingController TextController;

  final Function(String value) OnChanged;
  final Function(String value) onsubmitted;
  final VoidCallback OnButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.gentiumPlus(fontWeight: FontWeight.w800, fontSize: 20),
      onChanged: OnChanged,
      onSubmitted: onsubmitted,
      controller: TextController,

      decoration: InputDecoration(
        filled: true,
        suffix: IconButton(
          onPressed: OnButtonPressed,
          icon: Icon(Icons.clear_outlined),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Icon(Icons.search_rounded, color: Colors.black, size: 30),
        ),
        hintText: 'Search for your country',
        hintStyle: GoogleFonts.gentiumPlus(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
