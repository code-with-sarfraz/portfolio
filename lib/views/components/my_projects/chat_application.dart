import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class chat_app extends StatefulWidget {
  const chat_app({super.key});

  @override
  State<chat_app> createState() => _chat_appState();
}

class _chat_appState extends State<chat_app> {
  final List<String> _images = [
    'assets/images/chat_app/img_1.png',
    'assets/images/chat_app/img_2.png',
    'assets/images/chat_app/img_3.png',
    'assets/images/chat_app/img_4.png',
    'assets/images/chat_app/img_5.png',
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
    bool isMobile = screenWidth < 650;

    final imageSection = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // AnimatedSwitcher for smooth fade transition
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            _images[_currentIndex],
            key: ValueKey(_images[_currentIndex]),
            width: isMobile ? 80 : 100,
            height: isMobile ? 180 : 220,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 50,
              child: ElevatedButton(
                onPressed: _previousImage,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Icon(Icons.arrow_back, size: 16),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 30,
              width: 50,
              child: ElevatedButton(
                onPressed: _nextImage,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ),
          ],
        ),
      ],
    );

    final detailsSection = Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Text("➤ chat_application"),
          const SizedBox(height: 15),
          const Text(
            "Purpose",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Text("➤ Real-time communication"),
          const SizedBox(height: 15),
          const Text(
            "Technologies Used",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Text("🔹 Flutter for UI"),
          const Text("🔹 Firebase for backend support"),
          const Text("🔹 Figma for designing"),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse("");
                if (!await launchUrl(url)) {
                  throw Exception("Could not launch URL");
                }
              },
              icon: const Icon(Icons.download, size: 16),
              label: const Text("Download"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                foregroundColor: Colors.blueAccent,
                side: const BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
    );

    if (isMobile) {
      return Column(
        children: [imageSection, const SizedBox(height: 30), detailsSection],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [imageSection, const SizedBox(width: 40), detailsSection],
    );
  }
}
