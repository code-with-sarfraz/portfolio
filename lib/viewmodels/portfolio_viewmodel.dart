import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/portfolio_models.dart';

class PortfolioViewModel extends GetxController {
  // --- State ---
  final activeSection = 'Home'.obs;
  final isSideMenuOpen = false.obs;

  // Global keys for scrolling
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey certificatesKey = GlobalKey();
  final GlobalKey experianceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // --- Data ---
  final List<SkillItem> skills = [
    SkillItem(name: 'Flutter', iconPath: 'assets/images/skills/flutter.png'),
    SkillItem(name: 'Dart', iconPath: 'assets/images/skills/dart.png'),
    SkillItem(name: 'Firebase', iconPath: 'assets/images/skills/firebase.png'),
    SkillItem(name: 'SQLite', iconPath: 'assets/images/skills/sqlite.png'),
    SkillItem(name: 'Figma', iconPath: 'assets/images/skills/figma.png'),
  ];

  // --- Actions ---

  void scrollToSection(GlobalKey key, String sectionName) {
    activeSection.value = sectionName;
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not launch $url',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void openResume() async {
    // Attempting to open the relative asset path using url_launcher
    final Uri url = Uri.parse('assets/images/resume.pdf');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar('Error', 'Could not open resume',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void toggleSideMenu() {
    isSideMenuOpen.value = !isSideMenuOpen.value;
  }
}
