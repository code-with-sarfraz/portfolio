import 'package:flutter/material.dart';

import 'sectionCard.dart';
import 'slideUpTransition.dart';

class certificate extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: SectionCard(
        title: 'Certificates & Awards',
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildCertCard(
                  context,
                  'CALICO Fall 2024',
                  'assets/images/certificates/CALICO.jpeg',
                  'Certificate of Participation in a team solving complex coding challenges.',
                ),
                _buildCertCard(
                  context,
                  'Experience Letter',
                  'assets/images/certificates/7skies_cert.jpg',
                  '7 SKIES SOLUTIONS Experience Letter for Mobile Application Developer.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCertCard(BuildContext context, String title, String imagePath, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HeroTarget1(title, imagePath, title)),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: MediaQuery.of(context).size.width > 400 ? 350 : MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent.withOpacity(0.3), width: 1.5),
          boxShadow: [
             BoxShadow(
                color: Colors.blueAccent.withOpacity(0.05),
                blurRadius: 15,
                spreadRadius: 2,
             ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: title,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.blueAccent.withOpacity(0.5), width: 2)),
                ),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400, height: 1.5),
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

class HeroTarget1 extends StatelessWidget {
  final String tag;
  final String image;
  final String title;
  HeroTarget1(this.tag, this.image, this.title);
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: tag,
                child: InteractiveViewer(
                  child: Image.asset(
                    image, 
                    fit: BoxFit.contain, 
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title, 
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
