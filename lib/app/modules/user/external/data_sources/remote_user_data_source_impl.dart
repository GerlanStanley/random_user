import 'package:user/app/core/utils/print_debug_utils.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/helpers/http/http.dart';

import '../../domain/entities/user_entity.dart';
import '../../infra/data_sources/remote_user_data_source.dart';

import '../mappers/user_mapper.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final HttpHelper _httpHelper;

  RemoteUserDataSourceImpl(this._httpHelper);

  @override
  Future<UserEntity> getRandom() async {
    try {
      Map response = await _httpHelper.get('');
      return UserMapper.fromMap(response['results'][0]);
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      printDebug(stackTrace);
      throw ParseFailure(
        message: 'Erro ao mapear o json',
        stackTrace: stackTrace,
      );
    }
  }
}
