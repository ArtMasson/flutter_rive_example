import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleAnimationWidget extends StatelessWidget {
  const SimpleAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: RiveAnimation.asset(
          'vehicles.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
