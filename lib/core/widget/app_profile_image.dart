import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              // backgroundImage: AssetImage("assets/profile.jpg"),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.add_a_photo, size: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
