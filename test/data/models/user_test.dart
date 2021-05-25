import 'package:flutter_test/flutter_test.dart';
import 'package:yammi/data/models/user/user.dart';

void main() {
  const tUser = User('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c');

  test(
      'should return a valid model when the JSON is valid',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = {'access_token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'};
        // act
        final result = User.fromJson(jsonMap);
        // assert
        expect(result, tUser);
      },
    );
}