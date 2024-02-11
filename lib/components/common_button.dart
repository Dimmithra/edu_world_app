import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommonBtn extends StatelessWidget {
  const CommonBtn({
    super.key,
    required this.onPress,
    required this.btnName,
    this.backgroundColor,
    this.fontColor,
  });
  final Function() onPress;
  final String btnName;
  final Color? backgroundColor;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        btnName,
        style: TextStyle(
          color: fontColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
    );
  }
}
