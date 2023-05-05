import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import 'package:user/app/core/failures/failures.dart';
import 'package:user/app/modules/user/domain/entities/location_entity.dart';
import 'package:user/app/modules/user/domain/entities/name_entity.dart';
import 'package:user/app/modules/user/domain/entities/picture_entity.dart';
import 'package:user/app/modules/user/domain/entities/user_entity.dart';
import 'package:user/app/modules/user/domain/use_cases/save_user_use_case.dart';
import 'package:user/app/modules/user/presenter/stores/save_user/save_user_state.dart';
import 'package:user/app/modules/user/presenter/stores/save_user/save_user_store.dart';

class MockSaveUserUseCase extends Mock implements SaveUserUseCase {}

abstract class Callable<T> {
  void call([T? arg]) {}
}

class MockCallable<T> extends Mock implements Callable<T> {}

void main() {
  late MockSaveUserUseCase useCase;
  late SaveUserStore store;
  late UserEntity user;

  setUp(() {
    useCase = MockSaveUserUseCase();
    store = SaveUserStore(useCase);

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
    "Quando o useCase retornar um sucesso o "
    "bloc deve iniciar carregando e terminar com sucesso",
    () async {
      final statusChanged = MockCallable<SaveUserState>();

      when(() => useCase.call(user: any(named: 'user'))).thenAnswer(
        (_) async => const Right(true),
      );

      mobx.reaction<SaveUserState>(
        (_) => store.state,
        (newValue) => statusChanged(newValue),
      );

      await store.save(user: user);

      verifyInOrder([
        () => statusChanged(LoadingSaveUserState()),
        () => statusChanged(SuccessSaveUserState()),
      ]);
    },
  );

  test(
    "Quando o useCase retornar uma falha o "
    "bloc deve iniciar carregando e terminar com falha",
    () async {
      final statusChanged = MockCallable<SaveUserState>();

      when(() => useCase.call(user: any(named: 'user'))).thenAnswer(
        (_) async => Left<Failure, bool>(
          Failure(message: ""),
        ),
      );

      mobx.reaction<SaveUserState>(
        (_) => store.state,
        (newValue) => statusChanged(newValue),
      );

      await store.save(user: user);

      verifyInOrder([
        () => statusChanged(LoadingSaveUserState()),
        () => statusChanged(const FailureSaveUserState(error: '')),
      ]);
    },
  );
}
