import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final String menu;
  final List<MenuItem> items;

  const Menu(this.menu, this.items);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@JsonSerializable()
class MenuItem {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;

  const MenuItem(this.id, this.name, this.description, this.image, this.price);

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
}