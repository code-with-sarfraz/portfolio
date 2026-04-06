import 'package:flutter/material.dart';
import 'dart:async';

import 'package:portfolio/files/my_projects/chat_application.dart';
import 'package:portfolio/files/my_projects/weather_app.dart';

class AutoImageSlider extends StatefulWidget {
  const AutoImageSlider({super.key});

  @override
  State<AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.02;
    if(screenWidth<600){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("My Projects",style: TextStyle(fontSize: fontSize.clamp(15, 20), color: Colors.blue,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: 50,),
          chat_app(),
          SizedBox(height: 100,),
          weather_app(),
        ],
      );
    }else{
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("My Projects",style: TextStyle(fontSize: fontSize.clamp(15, 20), color: Colors.blue,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: 50,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 50,),
                chat_app(),
                SizedBox(width: 50,),
                weather_app()
              ],
            ),
          ),
        ],
      );
    }
  }
}