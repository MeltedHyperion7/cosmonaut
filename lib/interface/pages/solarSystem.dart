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
    return Stack(children: [

              InteractiveViewer(
                minScale: 0.01,
                maxScale: 5.0,
                child:SizedBox(
                  width: 10000,
                  height: 10000,  
                child: Stack(children: _planetManager.getPlanetWidgets(),) 
                )),
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
  }
}
