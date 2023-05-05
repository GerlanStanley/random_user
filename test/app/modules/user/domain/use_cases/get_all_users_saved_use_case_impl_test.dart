import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:user/app/core/failures/failures.dart';
import 'package:user/app/modules/user/domain/entities/location_entity.dart';
import 'package:user/app/modules/user/domain/entities/name_entity.dart';
import 'package:user/app/modules/user/domain/entities/picture_entity.dart';
import 'package:user/app/modules/user/domain/entities/user_entity.dart';
import 'package:user/app/modules/user/domain/repositories/user_repository.dart';
import 'package:user/app/modules/user/domain/use_cases/get_all_users_saved_use_case_impl.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late GetAllUsersSavedUseCaseImpl useCase;

  setUp(() {
    repository = MockUserRepository();
    useCase = GetAllUsersSavedUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(List<UserEntity>) quando o repository "
    "retornar um Right(List<UserEntity>)",
    () async {
      when(() => repository.getAllSaved()).thenAnswer((_) async {
        List<UserEntity> items = [];
        for (int i = 0; i < 3; i++) {
          items.add(UserEntity(
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
          ));
        }

        return Right(items);
      });

      var result = await useCase();

      expect(result.fold(id, id), isA<List<UserEntity>>());
    },
  );

  test(
    "Deve retornar um Left(Failure) quando o repository "
    "retornar um Left(Failure)",
    () async {
      when(() => repository.getAllSaved()).thenAnswer((_) async {
        return Left(Failure(message: ""));
      });

      var result = await useCase();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
