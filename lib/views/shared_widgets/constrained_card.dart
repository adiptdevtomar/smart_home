// Created by Adipt on 29/01/2022

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class QConstrainedCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const QConstrainedCard({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: height,
      width: width,
      borderRadius: 20,
      blur: 8,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
          ],
          stops: const [
            0,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.black.withOpacity(0.1),
        ],
      ),
      child: child,
    );
  }
}
