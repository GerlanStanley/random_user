import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/delete_user_use_case.dart';
import 'domain/use_cases/delete_user_use_case_impl.dart';
import 'domain/use_cases/get_all_users_saved_use_case.dart';
import 'domain/use_cases/get_all_users_saved_use_case_impl.dart';
import 'domain/use_cases/get_random_user_use_case.dart';
import 'domain/use_cases/get_random_user_use_case_impl.dart';
import 'domain/use_cases/save_user_use_case.dart';
import 'domain/use_cases/save_user_use_case_impl.dart';
import 'external/data_sources/local_user_data_source_impl.dart';
import 'external/data_sources/remote_user_data_source_impl.dart';
import 'infra/data_sources/local_user_data_source.dart';
import 'infra/data_sources/remote_user_data_source.dart';
import 'infra/repositories/user_repository_impl.dart';
import 'presenter/pages/list/list_users_page.dart';
import 'presenter/pages/profile/profile_page.dart';
import 'presenter/stores/delete_user/delete_user_store.dart';
import 'presenter/stores/get_all_users_saved/get_all_users_saved_store.dart';
import 'presenter/stores/get_random_user/get_random_user_store.dart';
import 'presenter/stores/save_user/save_user_store.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        // data_sources
        Bind.lazySingleton<RemoteUserDataSource>(
          (i) => RemoteUserDataSourceImpl(i()),
        ),
        Bind.lazySingleton<LocalUserDataSource>(
          (i) => LocalUserDataSourceImpl(i()),
        ),

        // repositories
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(i(), i()),
        ),

        // use_cases
        Bind.lazySingleton<GetRandomUserUseCase>(
          (i) => GetRandomUserUseCaseImpl(i()),
        ),
        Bind.lazySingleton<GetAllUsersSavedUseCase>(
          (i) => GetAllUsersSavedUseCaseImpl(i()),
        ),
        Bind.lazySingleton<SaveUserUseCase>(
          (i) => SaveUserUseCaseImpl(i()),
        ),
        Bind.lazySingleton<DeleteUserUseCase>(
          (i) => DeleteUserUseCaseImpl(i()),
        ),

        // stores
        Bind.factory<GetRandomUserStore>(
          (i) => GetRandomUserStore(i()),
        ),
        Bind.factory<GetAllUsersSavedStore>(
          (i) => GetAllUsersSavedStore(i()),
        ),
        Bind.factory<SaveUserStore>(
          (i) => SaveUserStore(i()),
        ),
        Bind.factory<DeleteUserStore>(
          (i) => DeleteUserStore(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => ProfilePage(localUserId: args.data),
        ),
        ChildRoute(
          '/list',
          child: (_, __) => const ListUsersPage(),
        ),
      ];
}
