import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class footer extends StatelessWidget {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.05;
    fontSize = fontSize.clamp(12, 20); // min 16, max 28
    if (screenWidth < 600) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        color: Colors.black12, // or any color
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Text("Services", style: TextStyle(fontSize: fontSize)),
                  SizedBox(height: 10),
                  Text("Flutter | Dart", style: TextStyle(fontSize: 11)),
                  Text("Firebase integration", style: TextStyle(fontSize: 11)),
                  Text("Api Integration", style: TextStyle(fontSize: 11)),
                  Text("State Management", style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Text("Contact Me", style: TextStyle(fontSize: fontSize)),
                  SizedBox(height: 10),
                  Text("📞 +923082974952", style: TextStyle(fontSize: 11)),
                  Text(
                    "📧 sarfrazlqp03@gmail.com",
                    style: TextStyle(fontSize: 11),
                  ),
                  Text("📍 Punjab, Pakistan", style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
            Column(
              children: [
                Text("Links", style: TextStyle(fontSize: fontSize)),
                InkWell(
                  onTap: () {
                    _openWhatsApp();
                  },
                  child: Text("WhatsApp", style: TextStyle(color: Colors.blue)),
                ),
                InkWell(
                  onTap: () {
                    openLink('https://github.com/code-with-sarfraz/');
                  },
                  child: Text("GitHub", style: TextStyle(color: Colors.blue)),
                ),
                InkWell(
                  onTap: () {
                    openLink(
                      "https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/",
                    );
                  },
                  child: Text("LinkedIn", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Divider(thickness: 1, color: Colors.grey.shade400),
            Center(
              child: Text(
                "© 2026 SarfrazAfzal | Mobile Application Developer | Built with Flutter & Dart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      14, // use MediaQuery if you want it smaller on small screens
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        color: Colors.black12, // or any color

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text("Services", style: TextStyle(fontSize: fontSize)),
                        SizedBox(height: 10),
                        Text("Flutter | Dart", style: TextStyle(fontSize: 11)),
                        Text(
                          "Firebase integration",
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          "State Management",
                          style: TextStyle(fontSize: 11),
                        ),

                        Text("api Integration", style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Contact Me",
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 15),
                            Text(
                              " +923082974952",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, size: 15),
                            Text(
                              " sarfrazlqp03@gmail.com",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icons.place, size: 15),
                            Expanded(
                              child: Text(
                                " punjab, Pakistan",
                                textAlign:
                                    TextAlign.center, // optional but better
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text("Links", style: TextStyle(fontSize: fontSize)),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            _openWhatsApp();
                          },
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            openLink('https://github.com/code-with-sarfraz/');
                          },
                          child: Text(
                            "GitHub",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            openLink(
                              "https://www.linkedin.com/in/muhammad-sarfraz-afzal-861b272a4?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app/",
                            );
                          },
                          child: Text(
                            "LinkedIn",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Divider(thickness: 1, color: Colors.grey.shade400),
            Center(
              child: Text(
                "© 2026 Sarfraz Afzal | Mobile Application Developer | Built with Flutter & Dart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      14, // use MediaQuery if you want it smaller on small screens
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }
  }
}
