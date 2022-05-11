import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rive_example/app/modules/home/presentation/models/animation_model.dart';

import 'home_store.dart';

class HomeController {
  final HomeStore store;

  HomeController({
    required this.store,
  });

  void onTapTile({
    required AnimationModel animation,
  }) {
    store.selectedAnimation = animation;
    Modular.to.navigate(animation.route);
  }
}
