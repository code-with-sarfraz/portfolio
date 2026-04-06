import 'dart:ui';

import 'package:flutter/material.dart';
class CenterListPage extends StatefulWidget {
  @override
  State<CenterListPage> createState() => _CenterListPageState();
}

class _CenterListPageState extends State<CenterListPage> {
  PageController controller = PageController(viewportFraction: 0.4);
  int currentPage = 0;

  List<String> items = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Grapes",
    "Mango",
    "Orange"
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blur List Example")),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              bool isCenter = index == currentPage;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text(
                          items[index],
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (!isCenter)
                      // Blur overlay
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}