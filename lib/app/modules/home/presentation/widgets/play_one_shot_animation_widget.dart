/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimationWidget extends StatefulWidget {
  const PlayOneShotAnimationWidget({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationWidgetState createState() =>
      _PlayOneShotAnimationWidgetState();
}

class _PlayOneShotAnimationWidgetState
    extends State<PlayOneShotAnimationWidget> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: RiveAnimation.asset(
              'vehicles.riv',
              animations: const ['idle', 'curves'],
              controllers: [_controller],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    _isPlaying ? null : _controller.isActive = true,
                child: const Text(
                  'Bounce',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
