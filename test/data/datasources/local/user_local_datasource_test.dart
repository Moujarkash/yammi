import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yammi/data/datasources/local/user_local_datasource.dart';
import 'package:yammi/data/models/user/user.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  const tUser = User('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c');
  final expectedJsonString = jsonEncode(tUser.toJson());

  late UserLocalDatasource userLocalDatasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    userLocalDatasource = UserLocalDatasource(mockSharedPreferences);
  });

  group('getCachedUser', () {
    test(
      'should return User from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(() => mockSharedPreferences.getString(UserLocalDatasource.userKey))
            .thenReturn(expectedJsonString);
        // act
        final result = userLocalDatasource.getStoredUser();
        // assert
        verify(() => mockSharedPreferences.getString(UserLocalDatasource.userKey));
        expect(result, equals(tUser));
      },
    );
  });

  group('cacheUser', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        when(() => mockSharedPreferences.setString(UserLocalDatasource.userKey, expectedJsonString)).thenAnswer((_) async => Future.value(true));

        // act
        userLocalDatasource.storeUser(tUser);
        // assert
        verify(() => mockSharedPreferences.setString(
          UserLocalDatasource.userKey,
          expectedJsonString,
        ));
      },
    );
  });
}