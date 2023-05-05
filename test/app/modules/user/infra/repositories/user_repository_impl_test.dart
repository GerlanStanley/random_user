import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/app/core/failures/failures.dart';

import 'package:user/app/modules/user/domain/entities/location_entity.dart';
import 'package:user/app/modules/user/domain/entities/name_entity.dart';
import 'package:user/app/modules/user/domain/entities/picture_entity.dart';
import 'package:user/app/modules/user/domain/entities/user_entity.dart';
import 'package:user/app/modules/user/infra/data_sources/local_user_data_source.dart';
import 'package:user/app/modules/user/infra/data_sources/remote_user_data_source.dart';
import 'package:user/app/modules/user/infra/repositories/user_repository_impl.dart';

class MockRemoteUserDataSource extends Mock implements RemoteUserDataSource {}

class MockLocalUserDataSource extends Mock implements LocalUserDataSource {}

void main() {
  late MockRemoteUserDataSource remoteDataSource;
  late MockLocalUserDataSource localDataSource;
  late UserRepositoryImpl repository;
  late UserEntity user;

  setUp(() {
    remoteDataSource = MockRemoteUserDataSource();
    localDataSource = MockLocalUserDataSource();
    repository = UserRepositoryImpl(remoteDataSource, localDataSource);

    user = UserEntity(
      uuid: faker.randomGenerator.integer(999).toString(),
      age: faker.randomGenerator.integer(80),
      username: faker.person.name(),
      birthdate: faker.date.dateTime(),
      cell: faker.phoneNumber.us(),
      phone: faker.phoneNumber.us(),
      email: faker.internet.email(),
      gender: 'female',
      nationality: 'US',
      name: NameEntity(
        title: 'Mr',
        first: faker.person.name(),
        last: faker.person.name(),
      ),
      location: LocationEntity(
        city: faker.address.city(),
        country: faker.address.country(),
        state: faker.address.state(),
        streetName: faker.address.streetName(),
        streetNumber: faker.randomGenerator.integer(9999),
        postcode: faker.randomGenerator.integer(9999).toString(),
        latitude: faker.randomGenerator.integer(9999).toString(),
        longitude: faker.randomGenerator.integer(9999).toString(),
        timezoneOffset: '+3.0',
      ),
      picture: PictureEntity(
        thumbnail: '',
        medium: '',
        large: '',
      ),
    );

    registerFallbackValue(user);
  });

  test(
    "Deve retornar um UserEntity quando o datasource retornar o objeto",
    () async {
      when(() => remoteDataSource.getRandom()).thenAnswer((_) async => user);

      var result = await repository.getRandom();

      expect(result.fold(id, id), isA<UserEntity>());
    },
  );

  test(
    "Deve retornar um Failure quando o datasource throws Failure",
    () async {
      when(() => remoteDataSource.getRandom()).thenThrow(Failure(message: ""));

      var result = await repository.getRandom();

      expect(result.fold(id, id), isA<Failure>());
    },
  );

  test(
    "Deve retornar uma List<UserEntity> quando o datasource retornar a lista",
    () async {
      when(() => localDataSource.getAll()).thenAnswer((_) async => [user]);

      var result = await repository.getAllSaved();

      expect(result.fold(id, id), isA<List<UserEntity>>());
    },
  );

  test(
    "Deve retornar um Failure quando o datasource throws Failure",
    () async {
      when(() => localDataSource.getAll()).thenThrow(Failure(message: ""));

      var result = await repository.getAllSaved();

      expect(result.fold(id, id), isA<Failure>());
    },
  );

  test(
    "Deve retornar uma bool quando o datasource salvar e retornar bool",
    () async {
      when(() => localDataSource.save(user: any(named: 'user')))
          .thenAnswer((_) async => true);

      var result = await repository.save(user: user);

      expect(result.fold(id, id), isA<bool>());
    },
  );

  test(
    "Deve retornar um Failure quando o datasource throws Failure",
    () async {
      when(() => localDataSource.save(user: any(named: 'user')))
          .thenThrow(Failure(message: ""));

      var result = await repository.save(user: user);

      expect(result.fold(id, id), isA<Failure>());
    },
  );

  test(
    "Deve retornar uma bool quando o datasource deletar e retornar bool",
    () async {
      when(() => localDataSource.delete(user: any(named: 'user')))
          .thenAnswer((_) async => true);

      var result = await repository.delete(user: user);

      expect(result.fold(id, id), isA<bool>());
    },
  );

  test(
    "Deve retornar um Failure quando o datasource throws Failure",
    () async {
      when(() => localDataSource.delete(user: any(named: 'user')))
          .thenThrow(Failure(message: ""));

      var result = await repository.delete(user: user);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
