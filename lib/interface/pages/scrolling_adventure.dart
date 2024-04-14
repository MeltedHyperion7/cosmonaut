import 'package:audioplayers/audioplayers.dart';
import 'package:cosmonaut/calculations/scaling.dart';
import 'package:cosmonaut/constants.dart';
import 'package:cosmonaut/facts.dart';
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

  // final GlobalKey factKey1 = GlobalKey(debugLabel: "TestFactKey");

  @override
  void initState() {
    super.initState();

    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(AssetSource('sounds/loop.mp3'));

    for (int i = 0; i < SCROLL_FACTS.length; i++) {
      opacities[GlobalKey()] = 0;
    }

    opacitiesKeys = opacities.keys.toList();

    _scrollController.addListener(() {
      setState(() {
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
                // double transitionStop = SCROLL_TEXT_TRANSITION_GAP + size.height;
                opacities[key] = 1.0;
              }
            }
          }
        }
      });
    });
  }

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
                    height: Scaling.getDistance(3),
                  ),
                  Planet('Mars', Scaling.getDiameter(4)),
                  SizedBox(
                    height: Scaling.getDistance(4),
                  ),
                  Planet('Jupiter', Scaling.getDiameter(5)),
                  SizedBox(
                    height: Scaling.getDistance(5),
                  ),
                  Planet('Saturn', Scaling.getDiameter(6)),
                  SizedBox(
                    height: Scaling.getDistance(6),
                  ),
                  Planet('Uranus', Scaling.getDiameter(7)),
                  SizedBox(
                    height: Scaling.getDistance(7),
                  ),
                  Planet('Neptune', Scaling.getDiameter(8)),
                ]))
              ],
            ),
            Positioned(
                top: 50.0,
                left: 0.0,
                child: Column(children: [

                  //Solar System Button
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SolarSystem()),
                        );
                      },
                      child: const Image(
                          image: AssetImage('assets/images/space-pig.png'),
                          height: 20,
                          width: 20)),

                  //Wordl Button
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Wordl("Jupiter",
                                  "What is the biggest planet in the solar system?")),
                        );
                      },
                      child: const Image(
                          image: AssetImage('assets/images/space-pig.png'),
                          height: 20,
                          width: 20))
                ])),
          ],
        ));
    //Wordl button
  }
}
