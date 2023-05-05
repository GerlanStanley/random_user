import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user/app/modules/user/domain/entities/location_entity.dart';
import 'package:user/app/modules/user/domain/entities/name_entity.dart';
import 'package:user/app/modules/user/domain/entities/picture_entity.dart';
import 'package:user/app/modules/user/domain/entities/user_entity.dart';
import 'package:user/app/modules/user/external/data_sources/local_user_data_source_impl.dart';

void main() {
  SharedPreferences sharedPreferences;
  LocalUserDataSourceImpl dataSource;
  const String key = "users";
  late UserEntity user = UserEntity(
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

  WidgetsFlutterBinding.ensureInitialized();

  group("GetAll", () {
    test("Deve retornar uma lista vazia quando não tiver nada armazenado", () async {
      SharedPreferences.setMockInitialValues({});

      sharedPreferences = await SharedPreferences.getInstance();
      dataSource = LocalUserDataSourceImpl(sharedPreferences);

      var result = await dataSource.getAll();
      expect(result, <List<UserEntity>>[]);
    });

    test("Deve retornar um List<UserEntity> quando tiver armazenado valores", () async {
      SharedPreferences.setMockInitialValues({key: successJson});

      sharedPreferences = await SharedPreferences.getInstance();
      dataSource = LocalUserDataSourceImpl(sharedPreferences);

      var result = await dataSource.getAll();
      expect(result, isA<List<UserEntity>>());
    });
  });

  group("Save And Remove", () {
    test(
      "Deve retornar true quando conseguir inserir e remover items da lista",
      () async {
        SharedPreferences.setMockInitialValues({});

        sharedPreferences = await SharedPreferences.getInstance();
        dataSource = LocalUserDataSourceImpl(sharedPreferences);

        expect(await dataSource.save(user: user), true);
        var result = await dataSource.getAll();
        expect(result.length, 1);

        expect(await dataSource.delete(user: user), true);
        result = await dataSource.getAll();
        expect(result.length, 0);
      },
    );
  });
}

const String successJson = r'''
[
  {
    "gender": "male",
    "name": {
        "title": "Mr",
        "first": "Christian",
        "last": "Burke"
    },
    "location": {
        "street": {
            "number": 3604,
            "name": "Camden Ave"
        },
        "city": "Darwin",
        "state": "Western Australia",
        "country": "Australia",
        "postcode": 8514,
        "coordinates": {
            "latitude": "-89.9763",
            "longitude": "-159.0906"
        },
        "timezone": {
            "offset": "+4:30",
            "description": "Kabul"
        }
    },
    "email": "christian.burke@example.com",
    "login": {
        "uuid": "21a515e4-f0f0-4d58-8682-f06737fe7251",
        "username": "orangecat989",
        "password": "guitar1",
        "salt": "9a8a2uGr",
        "md5": "ea53190001d42022bfdc16b7d3a2d952",
        "sha1": "1e9a09a8f69f904cac26d852a1287a9cf4089c72",
        "sha256": "a6ddc0eabf6004f673f845035a55620812fc86fe449c0b7341b6030cabe31514"
    },
    "dob": {
        "date": "1947-01-29T14:10:02.397Z",
        "age": 76
    },
    "registered": {
        "date": "2010-10-10T14:54:06.953Z",
        "age": 12
    },
    "phone": "02-4994-1301",
    "cell": "0484-793-846",
    "id": {
        "name": "TFN",
        "value": "296585265"
    },
    "picture": {
        "large": "https://randomuser.me/api/portraits/men/49.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/49.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/49.jpg"
    },
    "nat": "AU"
  }
]
''';
