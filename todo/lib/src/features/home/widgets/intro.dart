import 'package:flutter/material.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/theme/styles.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello Camila',
                  style: AppStyles.title,
                ),
                Text(
                  'You have work today',
                  style: AppStyles.body
                      .merge(const TextStyle(color: AppColors.gray)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => AppCoordinator.showProfile(),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the container circular
                border:
                    Border.all(width: 1, color: Colors.grey), // Adds a border
              ),
              child: ClipOval(
                child: Image.network(
                  'https://example.com/image.jpg', // Replace with your image URL
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
