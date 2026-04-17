import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/saved/contacts.dart';
import 'package:portfolio/views/components/certificates.dart';
import 'package:portfolio/views/components/education.dart';
import 'package:portfolio/views/components/experiance.dart';
import 'package:portfolio/views/components/footer.dart';
import 'package:portfolio/views/components/my_projects/my_projects.dart';
import 'package:portfolio/views/components/resume.dart';
import 'package:portfolio/views/components/skills.dart';

import 'package:url_launcher/url_launcher.dart';
import 'files/about.dart';

enum MenuItem {
  about,
  skills,
  projects,
  education,
  certificates,
  contact,
  experiance,
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late AnimationController ac;
  late Animation<Offset> a;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 1));
    a = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: ac, curve: Curves.easeInOut));
    ac.forward();
  }

  // Create GlobalKeys for each section
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey education = GlobalKey();
  final GlobalKey certificates = GlobalKey();
  final GlobalKey experiance = GlobalKey();
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openResume() async {
    final Uri url = Uri.parse(
      'build/web/resume.pdf',
    ); // relative path inside web
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      -0.5,
                      -0.5,
                    ), // shift the center if you want
                    radius: 2.0, // controls how wide the gradient spreads
                    colors: [
                      Colors.blue.shade900, // center
                      Colors.black12, // edges
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Flutter developer",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<MenuItem>(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.blue,
                              size: MediaQuery.of(context).size.width * 0.040,
                            ),
                            onSelected: (item) {
                              switch (item) {
                                case MenuItem.about:
                                  scrollToSection(aboutKey);
                                  break;
                                case MenuItem.skills:
                                  scrollToSection(skillsKey);
                                  break;
                                case MenuItem.projects:
                                  scrollToSection(projectsKey);
                                  break;
                                case MenuItem.education:
                                  scrollToSection(education);
                                  break;
                                case MenuItem.certificates:
                                  scrollToSection(certificates);
                                  break;
                                case MenuItem.contact:
                                  scrollToSection(contactKey);
                                  break;
                                case MenuItem.experiance:
                                  scrollToSection(experiance);
                                  break;
                              }
                            },
                            itemBuilder:
                                (context) => const [
                                  PopupMenuItem(
                                    value: MenuItem.about,
                                    child: Text("About"),
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.skills,
                                    child: Text("Skills"),
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.education,
                                    child: Text("Education"),
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.experiance,
                                    child: Text("Experience"),
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.projects,
                                    child: Text("Projects"),
                                  ),
                                ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.blue.shade900, // center
                Colors.black12, // edges
              ],
              center: Alignment.center, // start at center
              radius: 0.5, // covers whole screen
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          bool isWide = constraints.maxWidth > 700;
                          return isWide
                              ? Column(
                                children: [
                                  SizedBox(height: 50),
                                  SlideTransition(
                                    position: a,
                                    child: Hero(
                                      tag: 'profile-image',
                                      child: Card(
                                        elevation: 200,
                                        shadowColor: Colors.blue,
                                        child: Image.asset(
                                          "assets/images/profile.png",
                                          height: 255,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),

                                  // Text + Buttons
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Muhammad Sarfraz Afzal",
                                        style: TextStyle(fontSize: 26),
                                      ),
                                      const SizedBox(height: 6),
                                      const Text(
                                        "Mobile Application Developer",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(height: 15),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => resume(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(200, 40),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: Text("CV"),
                                      ),
                                      SizedBox(height: 20),
                                      Container(child: contact()),
                                    ],
                                  ),
                                ],
                              )
                              // 📱 Mobile layout (default)
                              : Column(
                                children: [
                                  SizedBox(height: 50),
                                  SlideTransition(
                                    position: a,
                                    child: Hero(
                                      tag: 'profile-image',
                                      child: Card(
                                        elevation: 200,
                                        shadowColor: Colors.blue,
                                        child: Image.asset(
                                          "assets/images/profile.png",
                                          height: 200,
                                          width: 300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Muhammad Sarfraz Afzal",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Mobile Application Developer",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => resume(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(200, 40),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: Text("CV"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  Container(child: contact()),
                                ],
                              );
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                    Divider(thickness: 1, color: Colors.grey.shade400),
                    SizedBox(height: 50),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isWide = constraints.maxWidth > 700;
                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            SizedBox(height: 30),
                            Center(
                              child: Container(
                                height: 315,
                                width: 800,
                                key: aboutKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "About Me",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    about(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth / 2) - 24
                                      : constraints.maxWidth,
                              child: Container(
                                width: double.infinity,
                                key: skillsKey,
                                child: skills(),
                              ),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth / 2) - 24
                                      : constraints.maxWidth,
                              child: Container(
                                key: education,
                                child: educations(),
                              ),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth / 2) - 24
                                      : constraints.maxWidth,
                              child: Container(
                                key: certificates,
                                child: certificate(),
                              ),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth / 2) - 24
                                      : constraints.maxWidth,
                              child: Container(
                                key: experiance,
                                child: Experiences(),
                              ),
                            ),
                            Divider(thickness: 1, color: Colors.grey.shade400),
                            SizedBox(height: 50),
                            SizedBox(
                              child: Container(
                                key: projectsKey,
                                child: AutoImageSlider(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 100),
                    footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
