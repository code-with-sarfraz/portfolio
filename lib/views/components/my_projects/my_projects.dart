import 'package:flutter/material.dart';

import 'package:portfolio/views/components/my_projects/chat_application.dart';
import 'package:portfolio/views/components/my_projects/news_app.dart';
import '../sectionCard.dart';
import '../slideUpTransition.dart';

class AutoImageSlider extends StatelessWidget {
  const AutoImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: SectionCard(
        title: 'My Projects',
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Wrap(
            spacing: 50,
            runSpacing: 80,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [chat_app(), news_app()],
          ),
        ),
      ),
    );
  }
}
