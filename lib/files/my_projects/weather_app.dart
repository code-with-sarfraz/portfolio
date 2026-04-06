import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class weather_app extends StatefulWidget {
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  final List<String> _images = [
    'assets/images/weather_app/img_1.png',
    'assets/images/weather_app/img.png',
    'assets/images/weather_app/img_2.png',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  void _nextImage() {
    _stopAutoScroll(); // stop auto-scroll on user interaction
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
    _startAutoScroll(); // restart auto-scroll
  }

  void _previousImage() {
    _stopAutoScroll();
    setState(() {
      _currentIndex = (_currentIndex - 1 + _images.length) % _images.length;
    });
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.02;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AnimatedSwitcher for smooth fade transition
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                _images[_currentIndex],
                key: ValueKey(_images[_currentIndex]),
                width: 100,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousImage,
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _nextImage,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 160),
              child: Text("Name   \n➤ weather_app"),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text("Purpose\n➤ Weather Info around us"),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: Text(
                "Technologies Used \n🔹Flutter for front-end\n🔹API for backend data\n🔹Figma",
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse("");

                  if (!await launchUrl(url)) {
                    throw Exception("Could not launch URL");
                  }
                },
                child: Text("Download"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
