import 'package:cosmonaut/calculations/scrolling_distances.dart';
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
  final ScrollingDistances _scrollingDistances = const ScrollingDistances(1000);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: <Widget>[
        CustomScrollView(
          reverse: true,
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Planet('Sun'),
              SizedBox(
                height: _scrollingDistances.getDistance(0),
              ),
              Planet('Mercury'),
              SizedBox(
                height: _scrollingDistances.getDistance(1),
              ),
              Planet('Venus'),
              SizedBox(
                height: _scrollingDistances.getDistance(2),
              ),
              Planet('Earth'),
              SizedBox(
                height: _scrollingDistances.getDistance(3),
              ),
              Planet('Mars'),
              SizedBox(
                height: _scrollingDistances.getDistance(4),
              ),
              Planet('Jupiter'),
              SizedBox(
                height: _scrollingDistances.getDistance(5),
              ),
              Planet('Saturn'),
              SizedBox(
                height: _scrollingDistances.getDistance(6),
              ),
              Planet('Uranus'),
              SizedBox(
                height: _scrollingDistances.getDistance(7),
              ),
              Planet('Neptune'),
            ]))
          ],
        ),
        Positioned(
            top: 22,
            right: 16,
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
    );
  }
}
