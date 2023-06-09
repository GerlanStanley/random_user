import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/constants/theme_constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Usuário aleatório',
      theme: ThemeConstants.light,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
