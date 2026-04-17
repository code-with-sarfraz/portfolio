import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:portfolio/views/home_view.dart';
import 'package:portfolio/viewmodels/portfolio_viewmodel.dart';

void main() {
  Get.put(PortfolioViewModel()); // Inject ViewModel globally
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0F1A), // deep dark blue background
        primaryColor: Colors.blueAccent,
      ),
      home: const HomeView(),
    );
  }
}
