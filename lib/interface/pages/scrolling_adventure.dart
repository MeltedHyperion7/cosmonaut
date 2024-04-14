import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cosmonaut/calculations/scaling.dart';
import 'package:cosmonaut/constants.dart';
import 'package:cosmonaut/facts.dart';
import 'package:cosmonaut/interface/pages/pig.dart';
import 'package:cosmonaut/interface/pages/planet.dart';
import 'package:cosmonaut/interface/pages/scroll_fact.dart';
import 'package:cosmonaut/interface/pages/wordl.dart';
import 'package:flutter/material.dart';
import 'package:cosmonaut/interface/pages/solarSystem.dart';

class ScrollingAdventure extends StatefulWidget {
  const ScrollingAdventure({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ScrollingAdventure> createState() => _ScrollingAdventureState();
}

class _ScrollingAdventureState extends State<ScrollingAdventure> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ScrollController _scrollController = ScrollController();
  Map<GlobalKey, double> opacities = {};
  late final List<GlobalKey> opacitiesKeys;
  // Map<GlobalKey, bool> pigEnables = {};
  // late final List<GlobalKey> pigEnablesKeys;
  // late AnimationController _animationController;
  double scrollProgress = 0;

  // final GlobalKey factKey1 = GlobalKey(debugLabel: "TestFactKey");

  @override
  void initState() {
    super.initState();

    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(AssetSource('sounds/loop.mp3'));

    for (int i = 0; i < SCROLL_FACTS.length; i++) {
      opacities[GlobalKey()] = 0;
    }

    // for (int i = 0; i < 1; i++) {
    //   pigEnables[GlobalKey()] = false;
    // }

    // pigEnablesKeys = pigEnables.keys.toList();
    opacitiesKeys = opacities.keys.toList();

    _scrollController.addListener(() {
      setState(() {
        scrollProgress = max(
            scrollProgress,
            _scrollController.position.extentBefore /
                _scrollController.position.extentTotal);

        for (var key in opacitiesKeys) {
          if (opacities[key]! != 1) {
            RenderBox? renderBox =
                key.currentContext?.findRenderObject() as RenderBox?;
            Offset? position = renderBox?.localToGlobal(Offset.zero);
            Size? size = renderBox?.size;

            if (position != null && size != null) {
              double bottomEdgeY = position.dy + size.height;

              if (bottomEdgeY > SCROLL_TEXT_TRANSITION_THRESHOLD) {
                // text should be appearing
                opacities[key] = 1.0;
              }
            }
          }
        }

        // for (var key in pigEnablesKeys) {
        //   if (!pigEnables[key]!) {
        //     RenderBox? renderBox =
        //         key.currentContext?.findRenderObject() as RenderBox?;
        //     Offset? position = renderBox?.localToGlobal(Offset.zero);
        //     Size? size = renderBox?.size;

        //     if (position != null && size != null) {
        //       double bottomEdgeY = position.dy + size.height;

        //       if (bottomEdgeY > SCROLL_TEXT_TRANSITION_THRESHOLD) {
        //         // text should be appearing
        //         // double transitionStop = SCROLL_TEXT_TRANSITION_GAP + size.height;
        //         pigEnables[key] = true;
        //       }
        //     }
        //   }
        // }
      });
    });
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
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg6.png'), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              controller: _scrollController,
              reverse: true,
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 80,
                  ),
                  Planet('Sun', Scaling.getDiameter(0)),
                  SizedBox(
                    height: Scaling.getDistance(0),
                  ),
                  ScrollFact(SCROLL_FACTS[0], opacities[opacitiesKeys[0]]!,
                      key: opacitiesKeys[0]),
                  SizedBox(
                    height: Scaling.getDistance(1),
                  ),
                  ScrollFact(SCROLL_FACTS[1], opacities[opacitiesKeys[1]]!,
                      key: opacitiesKeys[1]),
                  SizedBox(
                    height: Scaling.getDistance(2),
                  ),
                  Planet('Mercury', Scaling.getDiameter(1)),
                  SizedBox(
                    height: Scaling.getDistance(3),
                  ),
                  ScrollFact(SCROLL_FACTS[2], opacities[opacitiesKeys[2]]!,
                      key: opacitiesKeys[2]),
                  SizedBox(
                    height: Scaling.getDistance(4),
                  ),
                  ScrollFact(SCROLL_FACTS[3], opacities[opacitiesKeys[3]]!,
                      key: opacitiesKeys[3]),
                  SizedBox(
                    height: Scaling.getDistance(5),
                  ),
                  Planet('Venus', Scaling.getDiameter(2)),
                  SizedBox(
                    height: Scaling.getDistance(6),
                  ),
                  // Pig(key: pigEnablesKeys[0], pigEnables[pigEnablesKeys[0]]!),
                  ScrollFact(SCROLL_FACTS[4], opacities[opacitiesKeys[4]]!,
                      key: opacitiesKeys[4]),
                  SizedBox(
                    height: Scaling.getDistance(7),
                  ),
                  ScrollFact(SCROLL_FACTS[5], opacities[opacitiesKeys[5]]!,
                      key: opacitiesKeys[5]),
                  SizedBox(
                    height: Scaling.getDistance(8),
                  ),
                  Planet('Earth', Scaling.getDiameter(3)),
                  SizedBox(
                    height: Scaling.getDistance(9),
                  ),
                  ScrollFact(SCROLL_FACTS[6], opacities[opacitiesKeys[6]]!,
                      key: opacitiesKeys[6]),
                  SizedBox(
                    height: Scaling.getDistance(10),
                  ),
                  ScrollFact(SCROLL_FACTS[7], opacities[opacitiesKeys[7]]!,
                      key: opacitiesKeys[7]),
                  SizedBox(
                    height: Scaling.getDistance(11),
                  ),
                  ScrollFact(SCROLL_FACTS[8], opacities[opacitiesKeys[8]]!,
                      key: opacitiesKeys[8]),
                  SizedBox(
                    height: Scaling.getDistance(12),
                  ),
                  Planet('Mars', Scaling.getDiameter(4)),
                  SizedBox(
                    height: Scaling.getDistance(13),
                  ),
                  ScrollFact(SCROLL_FACTS[9], opacities[opacitiesKeys[9]]!,
                      key: opacitiesKeys[9]),
                  SizedBox(
                    height: Scaling.getDistance(14),
                  ),
                  ScrollFact(SCROLL_FACTS[10], opacities[opacitiesKeys[10]]!,
                      key: opacitiesKeys[10]),
                  SizedBox(
                    height: Scaling.getDistance(15),
                  ),
                  ScrollFact(SCROLL_FACTS[11], opacities[opacitiesKeys[11]]!,
                      key: opacitiesKeys[11]),
                  SizedBox(
                    height: Scaling.getDistance(16),
                  ),
                  Planet('Jupiter', Scaling.getDiameter(5)),
                  SizedBox(
                    height: Scaling.getDistance(17),
                  ),
                  ScrollFact(SCROLL_FACTS[12], opacities[opacitiesKeys[12]]!,
                      key: opacitiesKeys[12]),
                  SizedBox(
                    height: Scaling.getDistance(18),
                  ),
                  ScrollFact(SCROLL_FACTS[13], opacities[opacitiesKeys[13]]!,
                      key: opacitiesKeys[13]),
                  SizedBox(
                    height: Scaling.getDistance(19),
                  ),
                  ScrollFact(SCROLL_FACTS[14], opacities[opacitiesKeys[14]]!,
                      key: opacitiesKeys[14]),
                  SizedBox(
                    height: Scaling.getDistance(20),
                  ),
                  Planet('Saturn', Scaling.getDiameter(6)),
                  SizedBox(
                    height: Scaling.getDistance(21),
                  ),
                  ScrollFact(SCROLL_FACTS[15], opacities[opacitiesKeys[15]]!,
                      key: opacitiesKeys[15]),
                  SizedBox(
                    height: Scaling.getDistance(22),
                  ),
                  ScrollFact(SCROLL_FACTS[16], opacities[opacitiesKeys[16]]!,
                      key: opacitiesKeys[16]),
                  SizedBox(
                    height: Scaling.getDistance(23),
                  ),
                  ScrollFact(SCROLL_FACTS[17], opacities[opacitiesKeys[17]]!,
                      key: opacitiesKeys[17]),
                  SizedBox(
                    height: Scaling.getDistance(24),
                  ),
                  Planet('Uranus', Scaling.getDiameter(7)),
                  SizedBox(
                    height: Scaling.getDistance(25),
                  ),
                  ScrollFact(SCROLL_FACTS[18], opacities[opacitiesKeys[18]]!,
                      key: opacitiesKeys[18]),
                  SizedBox(
                    height: Scaling.getDistance(26),
                  ),
                  ScrollFact(SCROLL_FACTS[19], opacities[opacitiesKeys[19]]!,
                      key: opacitiesKeys[19]),
                  SizedBox(
                    height: Scaling.getDistance(27),
                  ),
                  ScrollFact(SCROLL_FACTS[20], opacities[opacitiesKeys[20]]!,
                      key: opacitiesKeys[20]),
                  SizedBox(
                    height: Scaling.getDistance(28),
                  ),
                  ScrollFact(SCROLL_FACTS[21], opacities[opacitiesKeys[21]]!,
                      key: opacitiesKeys[21]),
                  SizedBox(
                    height: Scaling.getDistance(29),
                  ),
                  ScrollFact(SCROLL_FACTS[22], opacities[opacitiesKeys[22]]!,
                      key: opacitiesKeys[22]),
                  SizedBox(
                    height: Scaling.getDistance(30),
                  ),
                  ScrollFact(SCROLL_FACTS[23], opacities[opacitiesKeys[23]]!,
                      key: opacitiesKeys[23]),
                  SizedBox(
                    height: Scaling.getDistance(31),
                  ),
                  ScrollFact(SCROLL_FACTS[24], opacities[opacitiesKeys[24]]!,
                      key: opacitiesKeys[24]),
                  SizedBox(
                    height: Scaling.getDistance(32),
                  ),
                  ScrollFact(SCROLL_FACTS[25], opacities[opacitiesKeys[25]]!,
                      key: opacitiesKeys[25]),
                  SizedBox(
                    height: Scaling.getDistance(33),
                  ),
                  Planet('Neptune', Scaling.getDiameter(8)),
                  const SizedBox(
                    height: 50,
                  )
                ]))
              ],
            ),
            RotatedBox(
                quarterTurns: -1,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  value: scrollProgress,
                )),
            // Mini steve on riding the progress bar
            Positioned(
                left: 15,
                top: 100 - scrollProgress,
                child: Image.asset(
                  "assets/images/steve.png",
                  width: 25,
                  height: 50,
                )),
            // Big steve in the centre of the screen
            Positioned(
                left: 200,
                top: 400,
                child: Image.asset(
                  "assets/images/steve.png",
                  width: 10,
                  height: 300,
                )),
            Positioned(
                top: 50.0,
                left: 12.0,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _audioPlayer.stop();
                    },
                    child: const Image(
                        image: AssetImage('assets/images/space-pig.png'),
                        height: 20,
                        width: 20))),
          ],
        ));
  }
}
