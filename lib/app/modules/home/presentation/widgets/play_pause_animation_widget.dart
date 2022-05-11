/// Demonstrates how to play and pause a looping animation
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimationWidget extends StatefulWidget {
  const PlayPauseAnimationWidget({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationWidgetState createState() =>
      _PlayPauseAnimationWidgetState();
}

class _PlayPauseAnimationWidgetState extends State<PlayPauseAnimationWidget> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: RiveAnimation.network(
              'https://cdn.rive.app/animations/vehicles.riv',
              controllers: [_controller],
              // Update the play state when the widget's initialized
              onInit: (_) => setState(() {}),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _togglePlay,
                child: Text(
                  isPlaying ? 'Pause' : 'Play',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
