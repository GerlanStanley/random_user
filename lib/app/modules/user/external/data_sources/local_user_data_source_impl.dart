import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';
import '../../infra/data_sources/local_user_data_source.dart';

import '../mappers/user_mapper.dart';

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final SharedPreferences _sharedPreferences;
  final key = "users";

  LocalUserDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<UserEntity>> getAll() async {
    String? usersStr = _sharedPreferences.getString(key);

    if (usersStr == null || usersStr.trim().isEmpty) {
      return [];
    }

    List usersMapList = json.decode(usersStr);

    return usersMapList.map((element) => UserMapper.fromMap(element)).toList();
  }

  @override
  Future<bool> save({required UserEntity user}) async {
    List<UserEntity> users = await getAll();

    users.add(user);

    List usersMapList =
        users.map((element) => UserMapper.toMap(element)).toList();

    return await _sharedPreferences.setString(key, json.encode(usersMapList));
  }
}
