import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/models/animation_model.dart';
import 'presentation/widgets/custom_controller_animation_widget.dart';
import 'presentation/widgets/liquid_download_animation_widget.dart';
import 'presentation/widgets/little_machine_animation_widget.dart';
import 'presentation/widgets/mascot_animation_widget.dart';
import 'presentation/widgets/play_one_shot_animation_widget.dart';
import 'presentation/widgets/play_pause_animation_widget.dart';
import 'presentation/widgets/simple_animation_widget.dart';
import 'presentation/widgets/simple_state_machine_animation_widget.dart';
import 'presentation/widgets/state_machine_animation_widget.dart';
import 'presentation/widgets/state_machine_skills_animation_widget.dart';

final List<AnimationModel> animationsList = [
  AnimationModel(
    title: 'Simple Animation',
    route: '/simple',
    widget: const SimpleAnimationWidget(),
  ),
  AnimationModel(
    title: 'Play/Pause Animation',
    route: '/play_pause',
    widget: const PlayPauseAnimationWidget(),
  ),
  AnimationModel(
    title: 'Flutter Mascot!',
    route: '/mascot',
    widget: const MascotAnimationPage(),
  ),
  AnimationModel(
    title: 'One Shot Animation',
    route: '/one_shot',
    widget: const PlayOneShotAnimationWidget(),
  ),
  AnimationModel(
    title: 'Simple State Machine (Click!)',
    route: '/simple_state_machine',
    widget: const SimpleStateMachineAnimationWidget(),
  ),
  AnimationModel(
    title: 'Button State Machine',
    route: '/button_state_machine',
    widget: const StateMachineAnimationWidget(),
  ),
  AnimationModel(
    title: 'Skills Machine',
    route: '/skills_machine',
    widget: const StateMachineSkillsAnimationWidget(),
  ),
  AnimationModel(
    title: 'Little Machine',
    route: '/little_machine',
    widget: const LittleMachineAnimationWidget(),
  ),
  AnimationModel(
    title: 'Liquid Download',
    route: '/liquid_download',
    widget: const LiquidDownloadAnimationWidget(),
  ),
  AnimationModel(
    title: 'Custom Controller - Speed',
    route: '/custom_controller',
    widget: const CustomControllerAnimationWidget(),
  ),
];

List<ChildRoute> getAnimationRoutes() {
  return animationsList
      .map(
        (animation) => ChildRoute(
          animation.route,
          child: (context, args) => animation.widget,
        ),
      )
      .toList();
}
