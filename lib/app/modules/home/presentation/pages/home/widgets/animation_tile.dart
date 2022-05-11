import 'package:flutter/material.dart';
import 'package:flutter_rive_example/app/modules/home/presentation/models/animation_model.dart';

class AnimationTile extends StatelessWidget {
  final AnimationModel animation;
  final void Function({required AnimationModel animation}) onTap;
  final bool selected;

  const AnimationTile({
    required this.animation,
    required this.onTap,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        animation.title,
      ),
      onTap: () => onTap(animation: animation),
      selected: selected,
    );
  }
}
