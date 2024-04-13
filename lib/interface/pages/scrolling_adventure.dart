import 'package:audioplayers/audioplayers.dart';
import 'package:cosmonaut/calculations/scaling.dart';
import 'package:cosmonaut/constants.dart';
import 'package:cosmonaut/interface/pages/creeper.dart';
import 'package:cosmonaut/interface/pages/planet.dart';
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

  @override
  void initState() {
    super.initState();

    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(AssetSource('sounds/loop.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg6.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              reverse: true,
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildListDelegate([
                  Planet('Sun', Scaling.getDiameter(0)),
                  const Creeper(),
                  SizedBox(
                    height: Scaling.getDistance(0),
                  ),
                  Planet('Mercury', Scaling.getDiameter(1)),
                  SizedBox(
                    height: Scaling.getDistance(1),
                  ),
                  Planet('Venus', Scaling.getDiameter(2)),
                  SizedBox(
                    height: Scaling.getDistance(2),
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
                top: SWITCH_BUTTON_MARGIN_TOP,
                right: SWITCH_BUTTON_MARGIN_RIGHT,
                child: OutlinedButton(
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
                        width: 20))),
          ],
        ));
  }
}
