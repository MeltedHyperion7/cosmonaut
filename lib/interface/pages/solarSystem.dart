import 'dart:io';

import 'package:cosmonaut/calculations/planetManager.dart';
import 'package:cosmonaut/constants.dart';
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

  @override
  void initState() {
    super.initState();

    _planetManager = PlanetManager();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 360.0),
        duration: const Duration(minutes: 1),
        builder: (BuildContext context, double angle, Widget? child) {
          return 
          Stack(children: [
            InteractiveViewer(
                minScale: 0.01,
                maxScale: 5.0,
                child: SizedBox(
                    width: 10000,
                    height: 10000,
                    child: Stack(
                      children: [
                        OrbitingPlanet("Sun", 0, 0, "sun1", 10),
                        OrbitingPlanet("Mercury", 14, angle+13, "mercury1", 3),
                        OrbitingPlanet("Venus", 55, angle+40, "venus1", 3),
                        OrbitingPlanet("Earth", 80, angle+139, "earth1", 4),
                        OrbitingPlanet("Mars", 105, angle+219, "mars1", 4),
                        OrbitingPlanet("Saturn", 125,angle+ 110, "saturn1", 7),
                        OrbitingPlanet("Jupiter", 150, angle+295, "jupiter1", 8),
                        OrbitingPlanet("Uranus", 200, angle+135, "uranus1", 7),
                      ],
                    ))),
            Positioned(
                top: SWITCH_BUTTON_MARGIN_TOP,
                right: SWITCH_BUTTON_MARGIN_RIGHT,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Image(
                        image: AssetImage('assets/images/space-pig.png'),
                        height: 20,
                        width: 20))),
          ]);
        });
  }
}
