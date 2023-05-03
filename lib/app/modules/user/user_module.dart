import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/random_user/random_user_page.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const RandomUserPage()),
      ];
}
