import 'package:flutter_test/flutter_test.dart';
import 'package:yammi/data/models/menu/menu.dart';

void main() {
  const tMenuItem = MenuItem(
      12,
      'Fridays Pick 3 طبق فرايديز الثلاثي',
      'Choose 3 apps and 3 sauces. Appetizers: mozzarella sticks...',
      '[IMAGE URL]',
      '60 AED');
  const tMenu = Menu('Appetizers المقبلات', [tMenuItem]);

  test(
    'should return a valid model when the JSON is valid',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        "menu": "Appetizers المقبلات",
        "items": [
          {
            "id": 12,
            "name": "Fridays Pick 3 طبق فرايديز الثلاثي",
            "description":
                "Choose 3 apps and 3 sauces. Appetizers: mozzarella sticks...",
            "image": "[IMAGE URL]",
            "price": "60 AED"
          }
        ]
      };
      // act
      final result = Menu.fromJson(jsonMap);
      // assert
      expect(result, tMenu);
    },
  );
}
