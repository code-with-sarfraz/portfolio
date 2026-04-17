import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sectionCard.dart';
import 'slideUpTransition.dart';

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

  final String emailAddress = 'sarfrazlqp03@gmail.com';
  void _openEmail() async {
    final Uri url = Uri.parse('mailto:$emailAddress');
    try {
      await launchUrl(
        url,
        webOnlyWindowName: '_self', // Forces the mailto intent to resolve in the current window instead of spawning a blank tab
      );
    } catch (e) {
      debugPrint('Could not launch email client: $e');
    }
  }

  Widget build(BuildContext context) {
    return ScrollSlideUp(
      child: SectionCard(
        title: "Let's Connect",
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    color: Colors.blueAccent.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.05),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Feel free to reach out for collaborations or just a friendly hello \uD83D\uDC4B",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade300,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildSocialButton(
                        assetPath: 'assets/images/gitHub.png',
                        onTap: () =>
                            openLink('https://github.com/code-with-sarfraz/'),
                      ),
                      _buildSocialButton(
                          assetPath: 'assets/images/linkedin.png',
                          onTap: () => openLink(
                              'https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/')),
                      _buildSocialButton(
                        assetPath: 'assets/images/wtsp.webp',
                        onTap: _openWhatsApp,
                      ),
                      _buildSocialButton(
                        iconData: Icons.email_outlined,
                        onTap: _openEmail,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({String? assetPath, IconData? iconData, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
        ),
        child: assetPath != null 
            ? Image.asset(assetPath, fit: BoxFit.contain)
            : Icon(iconData, color: Colors.blueAccent, size: 36),
      ),
    );
  }
}

