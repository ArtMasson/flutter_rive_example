import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MascotAnimationPage extends StatefulWidget {
  const MascotAnimationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MascotAnimationPage> createState() => _MascotAnimationPageState();
}

class _MascotAnimationPageState extends State<MascotAnimationPage> {
  Artboard? _riveArtboard;
  SMIInput<bool>? _dance;
  SMITrigger? _lookUp;

  void _hitLookUp() => _lookUp?.fire();

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('animations/flutter_mascot.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'birb');

        if (controller != null) {
          artboard.addController(controller);
          _dance = controller.findInput('dance');
          _lookUp = controller.findInput<bool>('look up') as SMITrigger;
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _riveArtboard == null
            ? const SizedBox()
            : Expanded(
                child: Rive(
                  artboard: _riveArtboard!,
                ),
              ),
        ButtonBar(
          children: [
            ElevatedButton(
              onPressed: _hitLookUp,
              child: const Text('Look up!'),
            ),
            ElevatedButton(
              onPressed: () {
                _dance?.value = !_dance!.value;
              },
              child: const Text('Dance!'),
            ),
          ],
        ),
      ]),
    );
  }
}
