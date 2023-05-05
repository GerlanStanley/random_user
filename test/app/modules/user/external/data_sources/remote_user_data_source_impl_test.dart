import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/app/core/failures/failures.dart';

import 'package:user/app/core/helpers/http/http.dart';
import 'package:user/app/modules/user/domain/entities/user_entity.dart';
import 'package:user/app/modules/user/external/data_sources/remote_user_data_source_impl.dart';

class MockHttpHelper extends Mock implements HttpHelper {}

void main() {
  late MockHttpHelper httpHelper;
  late RemoteUserDataSourceImpl dataSource;

  setUp(() {
    httpHelper = MockHttpHelper();
    dataSource = RemoteUserDataSourceImpl(httpHelper);
  });

  test("Deve retornar um UserEntity", () async {
    when(() => httpHelper.get(any())).thenAnswer((_) async => successJson);

    var result = await dataSource.getRandom();

    expect(result, isA<UserEntity>());
  });

  test("Deve lançar uma HttpFailure quando status diferente de 200", () async {
    when(() => httpHelper.get(any())).thenThrow(
      BadRequestHttpFailure(message: ""),
    );

    var result = dataSource.getRandom();

    expect(result, throwsA(isA<BadRequestHttpFailure>()));
  });

  test(
    "Deve retornar um ParseFailure quando der qualquer outra exceção",
    () async {
      when(() => httpHelper.get(any())).thenThrow(Exception());

      var result = dataSource.getRandom();

      expect(result, throwsA(isA<ParseFailure>()));
    },
  );

  test(
    "Deve retornar um ParseFailure quando não conseguir parsear a resposta",
    () async {
      when(() => httpHelper.get(any())).thenAnswer((_) async => invalidJson);

      var result = dataSource.getRandom();

      expect(result, throwsA(isA<ParseFailure>()));
    },
  );
}

final successJson = jsonDecode(r'''
{
    "results": [
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
    ],
    "info": {
        "seed": "12beb8ac0d9a7732",
        "results": 1,
        "page": 1,
        "version": "1.4"
    }
}
''');

final invalidJson = jsonDecode(r'''
{
    "id": 37
}
''');
