import 'package:flutter/material.dart';
import '../constant/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height = 55,
    this.width = 200,
    required this.title,
    required this.backGroundColor,
    required this.onTap,
  });

  final double height;
  final double? width;
  final String title;
  final Color backGroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
