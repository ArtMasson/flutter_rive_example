import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'pages/mascot_animation_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const HomePage(),
      children: _getAnimationRoutes(),
    ),
  ];
}

List<ChildRoute> _getAnimationRoutes() {
  return [
    ChildRoute(
      '/mascot',
      child: (context, args) => const MascotAnimationPage(),
    ),
  ];
}
