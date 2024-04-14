import 'package:flutter/material.dart';

class ScrollFact extends StatefulWidget {
  final double opacity;
  final String fact;

  const ScrollFact(this.fact, this.opacity, {super.key});

  @override
  State<StatefulWidget> createState() => _ScrollFactState();
}

class _ScrollFactState extends State<ScrollFact> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.opacity,
        duration: const Duration(seconds: 2),
        child: Text(widget.fact,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Minecraft',
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 16,
                letterSpacing: 4)));
  }
}
