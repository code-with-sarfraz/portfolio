import 'package:flutter/material.dart';
import '../sectionCard.dart';
import '../slideUpTransition.dart';

class educations extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: SectionCard(
        title: 'Education',
        child: Row(
          children: [
            Column(
              children: [
                Icon(Icons.arrow_circle_right, color: Colors.purple),
                Container(width: 2, height: 180, color: Colors.grey),
                //   Icon(Icons.arrow_circle_right, color: Colors.purple),
                //   Container(width: 2, height: 80, color: Colors.grey),
              ],
            ),
            SizedBox(width: 50),
            Expanded(
              child: Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     "College",
                  //     style: TextStyle(fontSize: 16, ),
                  //   ),
                  // ),
                  // Text(
                  //   "Intermediate Education in Pre-Engineering \n @ Saddique Faqeer Govt Boys Degree College Mithi, Tharparkar\n 2021-2023 \n Percentage : 80%",style: TextStyle(fontSize: 12),
                  // ),
                  // SizedBox(height: 90),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "The islamia university of Bahawalpur",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " BS Computer Science",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " 2021-2025 Graduated \n GPA : 3.15/4.0 ",
                      style: TextStyle(fontSize: 14),
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
