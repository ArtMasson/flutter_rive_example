import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart' as get_x;

import '../../../home_routes.dart';
import 'home_controller.dart';
import 'widgets/animation_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Rive Example',
        ),
      ),
      body: Row(
        children: [
          get_x.Obx(
            () => SizedBox(
              width: 300,
              child: ListView(
                children: animationsList
                    .map((animation) => AnimationTile(
                          animation: animation,
                          onTap: controller.onTapTile,
                          selected:
                              animation.route == controller.store.selectedRoute,
                        ))
                    .toList(),
              ),
            ),
          ),
          Container(
            width: 1,
            color: theme.primaryColor,
          ),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}
