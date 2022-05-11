import 'package:flutter_rive_example/app/modules/home/presentation/models/animation_model.dart';
import 'package:get/get.dart';

class HomeStore {
  final Rx<AnimationModel?> _selectedAnimation = Rx<AnimationModel?>(null);
  AnimationModel? get selectedAnimation => _selectedAnimation.value;
  set selectedAnimation(AnimationModel? value) =>
      _selectedAnimation.value = value;

  String? get selectedRoute => _selectedAnimation.value?.route;
}
