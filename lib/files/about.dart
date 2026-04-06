import 'package:flutter/material.dart';
import '../slideUpTransition.dart';

class about extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ScrollSlideUp(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 70,
          right: 70,
          bottom: 50,
          top: 10,
        ),
        child: Text(
          "Hello, this is Muhammad Sarfraz Afzal, \nA dedicated Software Engineering graduate with a strong focus on mobile application development using Flutter. Experienced in designing and developing cross-platform, high-performance applications with expertise in Dart, Flutter framework, MVVM architecture, API integration, and Firebase services. Committed to building scalable, efficient, and user-centric mobile solutions while continuously enhancing technical skills.",
          style: TextStyle(fontSize: screenWidth < 700 ? 12 : 16),
        ),
      ),
    );
  }
}
