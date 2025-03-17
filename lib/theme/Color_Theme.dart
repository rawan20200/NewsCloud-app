import 'package:flutter/material.dart';

FirstColorTheme() {
  Color primaryColor = Colors.blueAccent;
  Color SecColor = Colors.black;
  return LinearGradient(
    colors: [primaryColor, SecColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

SecColorTheme() {
  Color primaryColor = Colors.black;
  Color SecColor = Colors.blueAccent;
  return LinearGradient(
    colors: [primaryColor, SecColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
