import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cosmonaut/calculations/planetManager.dart';
import 'package:cosmonaut/constants.dart';
import 'package:cosmonaut/interface/pages/scrolling_adventure.dart';
import 'package:cosmonaut/interface/pages/wordl.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SolarSystem extends StatefulWidget {
  @override
  const SolarSystem({
    super.key,
  });

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  Offset offset = const Offset(50, 200);
  late PlanetManager _planetManager;
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(AssetSource('sounds/MENU.mp3'));
    _planetManager = PlanetManager();
  }

  // @override
  // void dispose()
  // {
  //   _audioPlayer.stop();
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InteractiveViewer(
          minScale: 0.01,
          maxScale: 5.0,
          child: SizedBox(
              width: 10000,
              height: 10000,
              child: Stack(children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 720.0),
                    duration: const Duration(minutes: 3),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet("Sun", 0, 0, "sun1", 10);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 3*720.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Mercury", 14, angle + 13, "mercury1", 3);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 3*630.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Venus", 55, angle + 40, "venus1", 3);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end:3* 540.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Earth", 80, angle + 139, "earth1", 4);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin:3* 450.0, end: 0.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Mars", 105, angle + 219, "mars1", 4);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 3*360.0, end: 0.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Saturn", 125, angle + 110, "saturn1", 7);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 3*270.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Jupiter", 150, angle + 295, "jupiter1", 8);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end:3* 180.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Uranus", 200, angle + 135, "uranus1", 7);
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 3*90.0, end: 0.0),
                    duration: const Duration(minutes: 1),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return OrbitingPlanet(
                          "Neptune", 250, angle + 335, "neptune1", 7);
                    }),
              ]))),
      
      //SOLAR SYSTEM
      // Positioned(
      //   top: SWITCH_BUTTON_MARGIN_TOP, 
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: MENU_TOP,),
            ElevatedButton(
              style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(16, 12, 16, 12))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScrollingAdventure(title: "Cosmonaut")));
                _audioPlayer.stop();

              },
              child: const Text("LAUNCH",style: TextStyle(color: Colors.black,fontSize: 30),)),
        ]))
        ],
      );  
  }
}
