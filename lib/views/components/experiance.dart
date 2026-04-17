import 'package:flutter/material.dart';
import 'sectionCard.dart';
import 'slideUpTransition.dart';

class Experiences extends StatelessWidget {
  const Experiences({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: SectionCard(
        title: 'Experience',
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              _buildExperienceItem(
                context,
                title: "Junior Application Developer (flutter)",
                company: "7skies solution Bahawalpur · Full-time",
                duration: "Jan 2023 - Dec 2024 · 2 yrs",
                location: "Bahawalpur · On-site",
                description:
                    "Junior Flutter Developer with experience in building mobile apps like chat and news applications using Flutter. Skilled in Firebase (authentication, real-time database), REST API integration, and MVVM architecture with GetX. Focused on creating responsive, user-friendly, and scalable applications.",
                isLast: false,
              ),
              _buildExperienceItem(
                context,
                title: "Frontend developer internship",
                company: "7 Skies Solutions · Part-time",
                duration: "Sep 2022 - Dec 2022 · 4 mos",
                location: "Bahawalpur, Punjab, Pakistan · On-site",
                description:
                    "Flutter app developer, turning cool ideas into user-friendly mobile apps. Passionate about coding and creating seamless experiences. Let's chat about your next app project! 🚀 📱",
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String title,
    required String company,
    required String duration,
    required String location,
    required String description,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        SizedBox(
          width: 20,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 150, // Approximate height for the line
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: Colors.blueAccent.withOpacity(0.3),
                ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                company,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    size: 12,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}

