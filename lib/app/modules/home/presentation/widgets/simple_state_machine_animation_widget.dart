import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleStateMachineAnimationWidget extends StatefulWidget {
  const SimpleStateMachineAnimationWidget({Key? key}) : super(key: key);

  @override
  _SimpleStateMachineAnimationWidgetState createState() =>
      _SimpleStateMachineAnimationWidgetState();
}

class _SimpleStateMachineAnimationWidgetState
    extends State<SimpleStateMachineAnimationWidget> {
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          child: RiveAnimation.asset(
            'vehicles.riv',
            fit: BoxFit.cover,
            onInit: _onRiveInit,
          ),
          onTap: _hitBump,
        ),
      ),
    );
  }
}
