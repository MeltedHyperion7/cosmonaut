import 'dart:math';

import 'package:flutter/widgets.dart';

class OrbitingPlanet extends StatefulWidget {
  late String planetID;
  late double distance;
  late double angle;
  late AssetImage image;
  late double size;
  OrbitingPlanet(
      this.planetID, this.distance, double angle, String imageName, this.size,
      {super.key}) {

    this.angle=degrees_to_rads(angle);
    image = AssetImage('assets/images/$imageName.png');
  }

  double degrees_to_rads(double  degrees)
  {
    return degrees*pi/180;
  }

  Offset polarToCartesian() {
    return Offset(distance * cos(angle)+200, distance * sin(angle)+500);
  }

  @override
  State<OrbitingPlanet> createState() => _OrbitingPlanetState();
}

class _OrbitingPlanetState extends State<OrbitingPlanet> {
  @override
  Widget build(BuildContext context) {
    Offset offset = widget.polarToCartesian();
    return Positioned(
        left: offset.dx, top: offset.dy, child: Image(image: widget.image,width: widget.size*5,height: widget.size*5,));
  }
}

class PlanetManager {
  late Map<String, OrbitingPlanet> planets;

  PlanetManager() {
    planets=<String, OrbitingPlanet>{};
    planets["Sun"] = OrbitingPlanet("Sun", 0, 0, "sun1", 10);
    planets["Mercury"] = OrbitingPlanet("Mercury", 214,  13, "mercury1", 3);
    planets["Venus"] = OrbitingPlanet("Venus", 55, 40, "venus1", 3);
    planets["Earth"] = OrbitingPlanet("Earth", 80, 39, "earth1", 4);
    planets["Mars"] = OrbitingPlanet("Mars", 105, 219, "mars1", 4);
    planets["Saturn"] = OrbitingPlanet("Saturn", 125, 110, "saturn1", 7);
    planets["Jupiter"] = OrbitingPlanet("Jupiter", 150, 295, "jupiter1", 8);
    planets["Uranus"] = OrbitingPlanet("Uranus", 200, 135, "uranus1", 7);
  }

  Map<String, OrbitingPlanet> getPlanets() {
    return planets;
  }

  List<Widget> getPlanetWidgets() {
    return planets.entries.map((e) => e.value).toList();
  }
}
