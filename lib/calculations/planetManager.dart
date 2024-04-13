import 'dart:math';

import 'package:flutter/widgets.dart';

class OrbitingPlanet extends StatefulWidget {
  late String planetID;
  late double distance;
  late double angle;
  late AssetImage image;
  late double size;
  OrbitingPlanet(
      this.planetID, this.distance, this.angle, String imageName, this.size,
      {super.key}) {
    image = AssetImage('assets/images/$imageName.png');
  }

  Offset polarToCartesian() {
    return Offset(distance * cos(angle), distance * sin(angle));
  }

  @override
  State<OrbitingPlanet> createState() => _OrbitingPlanetState();
}

class _OrbitingPlanetState extends State<OrbitingPlanet> {
  @override
  Widget build(BuildContext context) {
    Offset offset = widget.polarToCartesian();
    return Positioned(
        left: offset.dx, top: offset.dy, child: Image(image: widget.image,width: widget.size*100,height: widget.size*100,));
  }
}

class PlanetManager {
  late Map<String, OrbitingPlanet> planets;

  PlanetManager() {
    planets=<String, OrbitingPlanet>{};
    planets["Sun"] = OrbitingPlanet("Sun", 0, 0, "sun1", 10);
    planets["Mercury"] = OrbitingPlanet("Mercury", 50, 13, "mercury1", 3);
    planets["Venus"] = OrbitingPlanet("Venus", 100, 65, "venus1", 3);
    planets["Earth"] = OrbitingPlanet("Earth", 200, 126, "earth1", 4);
    planets["Mars"] = OrbitingPlanet("Mars", 300, 32, "mars1", 4);
    planets["Saturn"] = OrbitingPlanet("Saturn", 400, 267, "saturn1", 7);
    planets["Jupiter"] = OrbitingPlanet("Jupiter", 600, 155, "jupiter1", 8);
    planets["Uranus"] = OrbitingPlanet("Uranus", 800, 200, "uranus1", 7);
  }

  Map<String, OrbitingPlanet> getPlanets() {
    return planets;
  }

  List<Widget> getPlanetWidgets() {
    return planets.entries.map((e) => e.value).toList();
  }
}
