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

  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: Container(
        width: double.infinity,
        child: SectionCard(
          title: 'Contact Details',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => openLink('tel:+923082974952'),
                child: Row(
                  children: [
                    Text("Mobile No : "),
                    Text('+923082974952', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap:
                    () => openLink(
                      'https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/',
                    ),
                child: Row(
                  children: [
                    Text("LinkedIn    : "),
                    Text(
                      'https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () => openLink('https://github.com/code-with-sarfraz/'),
                child: Row(
                  children: [
                    Text("Github       : "),
                    Text(
                      'https://github.com/code-with-sarfraz/',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap:
                    () => openLink(
                      'https://mail.google.com/mail/?view=cm&fs=1&to=sarfrazlqp03@gmail.com',
                    ),
                child: Row(
                  children: [
                    Text("Gmail        : "),
                    Text(
                      'sarfrazlqp03@gmail.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
