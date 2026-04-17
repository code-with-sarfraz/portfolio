import 'package:flutter/material.dart';

class resume extends StatelessWidget {
  const resume({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/images/resume.png"),
      ),
    );
  }
}
