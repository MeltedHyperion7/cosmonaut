import 'dart:io';

import 'package:cosmonaut/calculations/planetManager.dart';
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
      // SizedBox(
          // width: 2000,
          // height: 2000,
          // child:
          //  Zoom(
          //     backgroundColor: Colors.transparent,
          //     canvasColor: Colors.transparent,
          //     initTotalZoomOut: true,
          //     child: const Stack(children: [
          //       Positioned(
          //           left: 600,
          //           top: 5,
          //           child: Image(image: AssetImage('assets/images/sun1.png')))
          //     ])

              // Stack(
              //   fit: StackFit.expand,
              //   children: _planetManager.getPlanetWidgets(),
              // )

              // )
              InteractiveViewer(
                child:SizedBox(
                  width: 10000,
                  height: 10000,  
                child: Stack(children: _planetManager.getPlanetWidgets(),) 
                )),
              
              
              // ),
      Positioned(
          top: 22,
          right: 16,
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
