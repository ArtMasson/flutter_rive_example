import 'package:flutter/material.dart';

class AnimationModel {
  final String title;
  final String route;
  final Widget widget;

  bool selected = false;

  AnimationModel({
    required this.title,
    required this.route,
    required this.widget,
  });
}
