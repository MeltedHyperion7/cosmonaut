import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

class Creeper extends StatefulWidget {
  const Creeper({super.key});

  @override
  State<Creeper> createState() => _CreeperState();
}

class _CreeperState extends State<Creeper> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: -1, end: 4),
      duration: const Duration(seconds: 4),
      curve: Curves.bounceOut,
      builder: (BuildContext context, double brightness, Widget? child) {
        return ChangeColors(
          brightness: brightness,
          child: Image.asset("assets/images/creeper.png"),
        );
      },
      onEnd: () => {_audioPlayer.play(AssetSource("sounds/creeper.mp3"))},
    );
  }
}
