import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:portfolio/views/components/about.dart';
import 'package:portfolio/views/components/certificates.dart';
import 'package:portfolio/views/components/contact.dart';
import 'package:portfolio/views/components/education.dart';
import 'package:portfolio/views/components/experiance.dart';
import 'package:portfolio/views/components/footer.dart';
import 'package:portfolio/views/components/my_projects/my_projects.dart';
import 'package:portfolio/views/components/skills.dart';
import 'package:portfolio/viewmodels/portfolio_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Find ViewModel globally
    final PortfolioViewModel vm = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    "Sarfraz.dev",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Spacer(),
                  // Desktop Menu
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (MediaQuery.of(context).size.width > 800) {
                        return Row(
                          children: [
                            _buildMenuItem("About", vm.aboutKey, vm),
                            _buildMenuItem("Skills", vm.skillsKey, vm),
                            _buildMenuItem("Education", vm.educationKey, vm),
                            _buildMenuItem("Experience", vm.experianceKey, vm),
                            _buildMenuItem("Projects", vm.projectsKey, vm),
                            const SizedBox(width: 20),
                            _buildContactBtn(vm),
                          ],
                        );
                      } else {
                        // Mobile Menu Icon
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            // Simple bottom sheet menu could go here
                            Get.bottomSheet(
                              Container(
                                color: const Color(0xFF0F172A),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildMenuItem("About", vm.aboutKey, vm),
                                    _buildMenuItem("Skills", vm.skillsKey, vm),
                                    _buildMenuItem(
                                      "Education",
                                      vm.educationKey,
                                      vm,
                                    ),
                                    _buildMenuItem(
                                      "Experience",
                                      vm.experianceKey,
                                      vm,
                                    ),
                                    _buildMenuItem(
                                      "Projects",
                                      vm.projectsKey,
                                      vm,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF131B32), Color(0xFF0A0F1A)],
            center: Alignment.topLeft,
            radius: 1.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120), // Padding under transparent app bar
              _buildHeroSection(context, vm),
              const SizedBox(height: 100),

              // Sections with GlobalKey assigning for smooth scrolling
              _buildSectionContainer(key: vm.aboutKey, child: about()),
              _buildSectionContainer(key: vm.skillsKey, child: skills()),
              _buildSectionContainer(key: vm.educationKey, child: educations()),
              _buildSectionContainer(
                key: vm.certificatesKey,
                child: certificate(),
              ),
              _buildSectionContainer(
                key: vm.experianceKey,
                child: Experiences(),
              ),
              _buildSectionContainer(
                key: vm.projectsKey,
                child: const AutoImageSlider(),
              ),
              _buildSectionContainer(key: vm.contactKey, child: contact()),

              const SizedBox(height: 50),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, GlobalKey key, PortfolioViewModel vm) {
    return Obx(() {
      final isActive = vm.activeSection.value == title;
      return TextButton(
        onPressed: () {
          if (Get.isBottomSheetOpen ?? false) Get.back();
          vm.scrollToSection(key, title);
        },
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blueAccent : Colors.white70,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      );
    });
  }

  Widget _buildContactBtn(PortfolioViewModel vm) {
    return ElevatedButton(
      onPressed: () => vm.scrollToSection(vm.contactKey, "Contact"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent.withOpacity(0.2),
        foregroundColor: Colors.blueAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.blueAccent),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: const Text("Contact Me"),
    );
  }

  Widget _buildHeroSection(BuildContext context, PortfolioViewModel vm) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = MediaQuery.of(context).size.width > 800;

          final content = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                ),
                child: const Text(
                  "Welcome to my portfolio",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Muhammad Sarfraz Afzal",
                style: TextStyle(
                  fontSize: isWide ? 56 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: isWide ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Mobile Application Developer.",
                style: TextStyle(
                  fontSize: isWide ? 28 : 20,
                  color: Colors.white60,
                ),
                textAlign: isWide ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment:
                    isWide ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => vm.openResume(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Download CV",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          );

          final image = Hero(
            tag: 'profile-image',
            child: Container(
              width: isWide ? 350 : 250,
              height: isWide ? 350 : 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.2),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment(
                    0.0,
                    -0.99,
                  ), // Shifts image downwards so top hair isn't cut off inside the circle
                ),
              ),
            ),
          );

          if (isWide) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Expanded(child: content), image],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [image, const SizedBox(height: 40), content],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionContainer({
    required GlobalKey key,
    required Widget child,
  }) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1200),
      child: child,
    );
  }
}
