import 'package:flutter_test/flutter_test.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';

void main() {
  const tRestaurant = Restaurant(1, 'Turkish Village - DFC Mall Branch',
      'Turkish', 3, 'Open Now', ["[A URL TO IMAGE]", "[A URL TO IMAGE]"]);

  test(
    'should return a valid model when the JSON is valid',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        "id": 1,
        "name": "Turkish Village - DFC Mall Branch",
        "cuisine": "Turkish",
        "rate": 3,
        "status": "Open Now",
        "prices": r"$$-$$$$",
        "top_comments": [
          {"body": "Compliment"},
          {"body": "Fantastic experience"}
        ],
        "images": ["[A URL TO IMAGE]", "[A URL TO IMAGE]"]
      };
      // act
      final result = Restaurant.fromJson(jsonMap);
      // assert
      expect(result, tRestaurant);
    },
  );
}
