// Created by Adipt on 29/01/2022

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class QCard extends StatelessWidget {
  final bool isEnabled;
  final Widget child;

  const QCard({
    Key? key,
    required this.isEnabled,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexContainer(
      borderRadius: 20,
      blur: 8,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: (isEnabled)
              ? [
                  Colors.white,
                  Colors.white,
                ]
              : [
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
          Colors.black.withOpacity(0.2),
        ],
      ),
      child: child,
    );
  }
}
