import 'package:flutter/material.dart';

import '../sectionCard.dart';
import '../slideUpTransition.dart';

class skills extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ScrollSlideUp(
      child: SectionCard(
        title: 'My Skills',
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "🔹 Dart & Flutter (Frontend)\n🔹 Firebase (Backend & APIs)\n🔹 SQLite (Database Management)\n🔹 Figma (UI/UX Design)\n🔹 Firebase (Authentication, Firestore)",
                style: TextStyle(fontSize: screenWidth < 700 ? 14 : 15),
              ),
            ),
            SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/images/skills/flutter.png",
                        height: 80,
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/images/skills/dart.png",
                        height: 80,
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/images/skills/firebase.png",
                        height: 80,
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/images/skills/sqlite.png",
                        height: 80,
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/images/skills/figma.png",
                        height: 80,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
