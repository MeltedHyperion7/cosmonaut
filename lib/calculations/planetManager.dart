import 'dart:math';

import 'package:flutter/widgets.dart';

class OrbitingPlanet extends StatefulWidget {
  late String planetID;
  late double distance;
  late AssetImage image;
  late double size;
  late double angle;

  double degrees_to_rads(double degrees) {
    return degrees * pi / 180;
  }

  OrbitingPlanet(
      this.planetID, this.distance, this.angle, String imageName, this.size,
      {super.key}) {
    // this.angle = degrees_to_rads(angle);
    image = AssetImage('assets/images/$imageName.png');
  }

  @override
  State<OrbitingPlanet> createState() => _OrbitingPlanetState();
}

class _OrbitingPlanetState extends State<OrbitingPlanet> {
  double degrees_to_rads(double degrees) {
    return degrees * pi / 180;
  }

  Offset polarToCartesian() {
    // print("Calculated Rads");
    double angle = degrees_to_rads(widget.angle);
    return Offset(
        widget.distance * cos(angle) + 200, widget.distance * sin(angle) + 500);
  }

  @override
  void initState() {
    super.initState();

    // angle = degrees_to_rads(widget.angle);
  }

  @override
  Widget build(BuildContext context) {
    // widget.angle+=10;
    Offset offset = polarToCartesian();

    return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Image(
          image: widget.image,
          width: widget.size * 5,
          height: widget.size * 5,
        ));
  }
}

class PlanetManager {
  late Map<String, OrbitingPlanet> planets;

  PlanetManager() {
    planets = <String, OrbitingPlanet>{};
    OrbitingPlanet("Sun", 0, 0, "sun1", 10);
    OrbitingPlanet("Mercury", 214, 13, "mercury1", 3);
    OrbitingPlanet("Venus", 55, 40, "venus1", 3);
    OrbitingPlanet("Earth", 80, 39, "earth1", 4);
    OrbitingPlanet("Mars", 105, 219, "mars1", 4);
    OrbitingPlanet("Saturn", 125, 110, "saturn1", 7);
    OrbitingPlanet("Jupiter", 150, 295, "jupiter1", 8);
    OrbitingPlanet("Uranus", 200, 135, "uranus1", 7);
  }

  Map<String, OrbitingPlanet> getPlanets() {
    return planets;
  }

  // List<Widget> updatePlanetWidgets(angle) {
  //   planets.forEach((key, value) {
  //     value.add_angle(angle);
  //   });
  //   return planets.entries.map((e) => e.value).toList();
  // }
}
