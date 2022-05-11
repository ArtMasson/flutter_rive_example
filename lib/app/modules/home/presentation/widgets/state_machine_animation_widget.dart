import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

/// An example showing how to drive two boolean state machine inputs.
class StateMachineAnimationWidget extends StatefulWidget {
  const StateMachineAnimationWidget({Key? key}) : super(key: key);

  @override
  _StateMachineAnimationWidgetState createState() =>
      _StateMachineAnimationWidgetState();
}

class _StateMachineAnimationWidgetState
    extends State<StateMachineAnimationWidget> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _hoverInput;
  SMIInput<bool>? _pressInput;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('rocket.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Button');
        if (controller != null) {
          artboard.addController(controller);
          _hoverInput = controller.findInput('Hover');
          _pressInput = controller.findInput('Press');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : MouseRegion(
                onEnter: (_) => _hoverInput?.value = true,
                onExit: (_) => _hoverInput?.value = false,
                child: GestureDetector(
                  onTapDown: (_) => _pressInput?.value = true,
                  onTapCancel: () => _pressInput?.value = false,
                  onTapUp: (_) => _pressInput?.value = false,
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Rive(
                      artboard: _riveArtboard!,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
