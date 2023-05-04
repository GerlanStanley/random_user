import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helpers/http/http.dart';
import 'modules/splash/presenter/pages/splash_page.dart';
import 'modules/user/user_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind<SharedPreferences>(
          (i) => SharedPreferences.getInstance(),
        ),
        Bind.lazySingleton<Dio>((i) => Dio()),
        Bind.lazySingleton<Interceptor>((i) => CustomInterceptor()),
        Bind.lazySingleton<HttpHelper>((i) => HttpHelperImpl(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/user', module: UserModule(), guards: [AsyncGuard()])
      ];
}

class AsyncGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }
}
