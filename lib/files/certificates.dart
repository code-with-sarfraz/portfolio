import 'package:flutter/material.dart';

import '../sectionCard.dart';
import '../slideUpTransition.dart';

class certificate extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Set container size based on breakpoints
    double containerWidth;
    double containerHeight;

    if (screenWidth < 600) {
      // Mobile
      containerWidth = screenWidth * 0.9;
      containerHeight = screenHeight * 0.35;
    } else if (screenWidth < 1000) {
      // Tablet
      containerWidth = screenWidth * 2; // two items side by side
      containerHeight = screenHeight * 0.45;
    } else {
      // Desktop
      containerWidth = screenWidth * 0.99; // smaller, many side by side
      containerHeight = screenHeight * 0.48;
    }
    return ScrollSlideUp(
      child: SectionCard(
        title: 'Certificates',
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: containerHeight,
            width: containerWidth,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      listItem(
                        context,
                        'Programming Competitions & Certifications',
                        'assets/images/certificates/CALICO.jpeg',
                        'Certificate of Participation  CALICO Fall 2024 UC Berkeley Worked in a team to solve coding challenges and improve problem-solving skills',
                      ),
                      // listItem(
                      //   context,
                      //   'AI Certificate',
                      //   'assets/images/certificates/AIcert.png',
                      //   'Exited to shared my latest Artificial Intelligence certificate from coursera.',
                      // ),
                    ],
                  ),
                ),
                Expanded(child: Icon(Icons.compare_arrows_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

listItem(BuildContext context, String tag, String image, String title) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeroTarget1(tag, image, title)),
      );
    },
    child: Center(
      child: Column(
        children: [
          Hero(
            tag: tag,
            child: Card(
              child: Image.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.450,
                height: MediaQuery.of(context).size.width * 0.200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class HeroTarget1 extends StatelessWidget {
  final String tag;
  final String image;
  final String title;
  HeroTarget1(this.tag, this.image, this.title);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Hero(
                  tag: tag,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image, height: 500, width: 500),
                  ),
                ),
                Text(title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
