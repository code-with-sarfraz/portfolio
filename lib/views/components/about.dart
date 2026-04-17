import 'package:flutter/material.dart';
import 'slideUpTransition.dart';

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
          "Software Engineering graduate specializing in Flutter development. Experienced in building cross-platform, high-performance mobile applications using Dart, MVVM architecture, GetX, API integration, and Firebase. Passionate about creating seamless user experiences and continuously exploring modern mobile technologies.",
          style: TextStyle(fontSize: screenWidth < 700 ? 12 : 16),
        ),
      ),
    );
  }
}
