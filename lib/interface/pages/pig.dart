import 'dart:math';

import 'package:flutter/material.dart';

class Pig extends StatefulWidget {
  final bool enabled;

  Pig(this.enabled, {super.key});

  @override
  State<StatefulWidget> createState() => _PigState();
}

class _PigState extends State<Pig> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (widget.enabled) {
      return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
                angle: _animation.value * 2 * pi,
                child: Positioned(
                  top: 50,
                  right: width * _animation.value,
                  child: const Image(
                    image: const AssetImage('assets/images/space-pig.png'),
                    height: 150,
                    width: 170,
                  ),
                ));
          });
    } else {
      return const Positioned(
          top: 50,
          right: -200,
          child: Image(
            image: AssetImage('assets/images/space-pig.png'),
            height: 150,
            width: 170,
          ));
    }
  }
}
