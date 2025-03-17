import 'package:flutter/material.dart';

class shadermasktheme extends StatelessWidget {
  const shadermasktheme({
    super.key,
    required this.lineargradiant,
    required this.widget,
  });

  final LinearGradient lineargradiant;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return lineargradiant.createShader(bounds);
      },
      child: widget,
    );
  }
}
