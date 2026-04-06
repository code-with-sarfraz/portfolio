// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'files/about.dart';
// import 'files/certificates.dart';
// import 'files/contact.dart';
// import 'files/education.dart';
// import 'files/experiance.dart';
// import 'files/footer.dart';
// import 'files/skills.dart';
// import 'imageHero.dart';
// import 'dart:html' as html;
//
// enum MenuItem {
//   about,
//   skills,
//   projects,
//   education,
//   certificates,
//   contact,
//   experiance,
// }
//
// class home extends StatefulWidget {
//   @override
//   State<home> createState() => _homeState();
// }
//
// class _homeState extends State<home> with SingleTickerProviderStateMixin {
//   late AnimationController ac;
//   late Animation<Offset> a;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ac = AnimationController(vsync: this, duration: Duration(seconds: 1));
//     a = Tween<Offset>(
//       begin: Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: ac, curve: Curves.easeInOut));
//     ac.forward();
//   }
//
//   // Create GlobalKeys for each section
//   final GlobalKey aboutKey = GlobalKey();
//   final GlobalKey skillsKey = GlobalKey();
//   final GlobalKey projectsKey = GlobalKey();
//   final GlobalKey contactKey = GlobalKey();
//   final GlobalKey education = GlobalKey();
//   final GlobalKey certificates = GlobalKey();
//   final GlobalKey experiance = GlobalKey();
//   void scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(seconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//
//   final String phoneNumber = '923325804476';
//   void _openWhatsApp() async {
//     final Uri url = Uri.parse('https://wa.me/$phoneNumber');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not open WhatsApp';
//     }
//   }
//
//   void openLink(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(100),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: AppBar(
//               flexibleSpace: Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "My Portfolio",
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.width * 0.044,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: PopupMenuButton<MenuItem>(
//                           icon: const Icon(Icons.menu),
//                           onSelected: (item) {
//                             switch (item) {
//                               case MenuItem.about:
//                                 scrollToSection(aboutKey);
//                                 break;
//                               case MenuItem.skills:
//                                 scrollToSection(skillsKey);
//                                 break;
//                               case MenuItem.projects:
//                                 scrollToSection(projectsKey);
//                                 break;
//                               case MenuItem.education:
//                                 scrollToSection(education);
//                                 break;
//                               case MenuItem.certificates:
//                                 scrollToSection(certificates);
//                                 break;
//                               case MenuItem.contact:
//                                 scrollToSection(contactKey);
//                                 break;
//                               case MenuItem.experiance:
//                                 scrollToSection(experiance);
//                                 break;
//                             }
//                           },
//                           itemBuilder: (context) => const [
//                             PopupMenuItem(
//                               value: MenuItem.about,
//                               child: Text("About"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.skills,
//                               child: Text("Skills"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.education,
//                               child: Text("Education"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.certificates,
//                               child: Text("Certificates"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.contact,
//                               child: Text("Contact"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.experiance,
//                               child: Text("Experience"),
//                             ),
//                             PopupMenuItem(
//                               value: MenuItem.projects,
//                               child: Text("Projects"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: ConstrainedBox(
//           constraints: BoxConstraints(maxWidth: 1200),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   Center(
//                     child: LayoutBuilder(
//                       builder: (context, constraints) {
//                         bool isWide = constraints.maxWidth > 700;
//                         return isWide
//                             ? Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // Image
//                             SlideTransition(
//                               position: a,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(100),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             ImagePreviewScreen(),
//                                       ),
//                                     );
//                                   },
//                                   child: Hero(
//                                     tag: 'profile-image',
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                         100,
//                                       ),
//                                       child: Image.asset(
//                                         "assets/images/profile.jpg",
//                                         height: 180,
//                                         width: 180,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             const SizedBox(width: 30),
//
//                             // Text + Buttons
//                             Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "Sooraj Kumar",
//                                   style: TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 6),
//                                 const Text(
//                                   "Mobile Application Developer",
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 const SizedBox(height: 15),
//
//                                 Row(
//                                   children: [
//                                     ElevatedButton.icon(
//                                       onPressed: () {
//                                         html.window.open('resume.pdf', '_blank');
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.blue,
//                                       ),
//                                       icon: const Icon(Icons.download),
//                                       label: const Text(
//                                         'Download CV',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 12),
//                                     ElevatedButton.icon(
//                                       onPressed: () {
//                                         _openWhatsApp();
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.green,
//                                       ),
//                                       icon: const Icon(Icons.call),
//                                       label: const Text(
//                                         'WhatsApp',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                         // 📱 Mobile layout (default)
//                             : Column(
//                           children: [
//                             SlideTransition(
//                               position: a,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(100),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             ImagePreviewScreen(),
//                                       ),
//                                     );
//                                   },
//                                   child: Hero(
//                                     tag: 'profile-image',
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                         100,
//                                       ),
//                                       child: Image.asset(
//                                         "assets/images/profile.jpg",
//                                         height: 180,
//                                         width: 180,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               "Sooraj Kumar",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               "Mobile Application Developer",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     html.window.open('resume.pdf', '_blank');
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.blue,
//                                   ),
//                                   icon: const Icon(Icons.download),
//                                   label: const Text(
//                                     'Download CV',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     _openWhatsApp();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   icon: const Icon(Icons.call),
//                                   label: const Text(
//                                     'WhatsApp',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//
//
//                   Divider(thickness: 1, color: Colors.grey.shade400),
//                   SizedBox(height: 20),
//                   LayoutBuilder(
//                     builder: (context, constraints) {
//                       bool isWide = constraints.maxWidth > 700;
//                       return Wrap(
//                         spacing: 16,
//                         runSpacing: 16,
//                         children: [
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(key: contactKey, child: contact()),
//                           ),
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(key: aboutKey, child: about()),
//                           ),
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(
//                               width: double.infinity,
//                               key: skillsKey,
//                               child: skills(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(
//                               key: certificates,
//                               child: certificate(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(
//                               key: education,
//                               child: educations(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: isWide
//                                 ? (constraints.maxWidth / 2) - 24
//                                 : constraints.maxWidth,
//                             child: Container(
//                               key: experiance,
//                               child: experiances(),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                   SizedBox(height: 30),
//                   footer(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }