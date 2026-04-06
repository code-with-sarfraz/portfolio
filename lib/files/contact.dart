import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../sectionCard.dart';
import '../slideUpTransition.dart';

class contact extends StatelessWidget {
  void openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  final String phoneNumber = '+923082974952';
  void _openWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open WhatsApp';
    }
  }

  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                openLink('https://github.com/code-with-sarfraz/');
              },
              icon: Image.asset(
                'assets/images/gitHub.png',
                height: 50,
                width: 50,
              ),
            ),
            IconButton(
              onPressed: () {
                openLink(
                  'https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/',
                );
              },
              icon: Image.asset(
                'assets/images/linkedin.png',
                height: 50,
                width: 50,
              ),
            ),
            IconButton(
              onPressed: () {
                _openWhatsApp();
              },
              icon: Image.asset(
                'assets/images/wtsp.webp',
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
