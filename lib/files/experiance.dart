import 'package:flutter/material.dart';

import '../sectionCard.dart';
import '../slideUpTransition.dart';

class experiances extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Set container size based on breakpoints
    double containerWidth;
    double containerHeight;

    if (screenWidth < 600) {
      // Mobile
      containerWidth = screenWidth * 0.9;
      containerHeight = screenHeight * 0.75;
    } else if (screenWidth < 1000) {
      // Tablet
      containerWidth = screenWidth * 0.50; // two items side by side
      containerHeight = screenHeight * 0.90;
    } else {
      // Desktop
      containerWidth = screenWidth * 0.3; // smaller, many side by side
      containerHeight = screenHeight * 0.90;
    }
    return ScrollSlideUp(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        child: SectionCard(
          title: 'Experiance',
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🔹About two year+ experience in Flutter & Dart with firebase",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("🔹Version control system Git & Github"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🔹Built responsive mobile and web applications using Flutter",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("🔹API integration and real-time data handling"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("🔹Created reusable widgets and custom components"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🔹Integrated Firebase services (Hosting, auth, assets)",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("🔹Database management "),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("🔹State management (Getx, BLoC)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
