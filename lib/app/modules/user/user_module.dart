import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/get_random_user_use_case.dart';
import 'domain/use_cases/get_random_user_use_case_impl.dart';
import 'external/data_sources/remote_user_data_source_impl.dart';
import 'infra/data_sources/remote_user_data_source.dart';
import 'infra/repositories/user_repository_impl.dart';
import 'presenter/pages/profile/profile_page.dart';
import 'presenter/stores/get_random_user/get_random_user_store.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // data_sources
        Bind.lazySingleton<RemoteUserDataSource>(
          (i) => RemoteUserDataSourceImpl(i()),
        ),

        // repositories
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(i()),
        ),

        // use_cases
        Bind.lazySingleton<GetRandomUserUseCase>(
          (i) => GetRandomUserUseCaseImpl(i()),
        ),

        // stores
        Bind.factory<GetRandomUserStore>(
          (i) => GetRandomUserStore(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => ProfilePage(localUserId: args.data),
        ),
      ];
}
