import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          SizedBox(
            width: 300,
            child: ListView(children: [
              ListTile(
                title: const Text(
                  'Flutter mascot animmation',
                ),
                onTap: () {
                  Modular.to.navigate('/mascot');
                },
              ),
            ]),
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
