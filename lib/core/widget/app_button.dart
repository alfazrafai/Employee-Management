import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height = 55,
    required this.width,
    required this.title,
    required this.backGroundColor,
  });

  final double height;
  final double? width;
  final String title;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backGroundColor,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
