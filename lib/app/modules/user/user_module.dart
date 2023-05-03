import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/profile/profile_page.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => ProfilePage(localUserId: args.data),
        ),
      ];
}
