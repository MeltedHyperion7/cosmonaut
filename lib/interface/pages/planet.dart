import 'dart:async';

import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  final String name;
  late final String imagePath1;
  late final String imagePath2;

  Planet(this.name, {super.key}) {
    String nameLowered = name.toLowerCase();
    imagePath1 = "assets/images/${nameLowered}1.png";
    imagePath2 = "assets/images/${nameLowered}2.png";
  }

  @override
  State<StatefulWidget> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  late Timer _timer;
  int _currentImageNum = 1;
  late String currentImage;

  @override
  void initState() {
    super.initState();

    currentImage = widget.imagePath1;

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      updateImage();
    });
  }

  void updateImage() {
    setState(() {
      if (_currentImageNum == 1) {
        currentImage = widget.imagePath2;
        _currentImageNum = 2;
      } else {
        currentImage = widget.imagePath1;
        _currentImageNum = 1;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage(currentImage)),
        Text(widget.name, textAlign: TextAlign.center)
      ],
    );
  }
}
