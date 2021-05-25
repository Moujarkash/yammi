import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu extends Equatable {
  final String menu;
  final List<MenuItem> items;

  const Menu(this.menu, this.items);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  @override
  List<Object?> get props => [menu, items];
}

@JsonSerializable()
class MenuItem extends Equatable{
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;

  const MenuItem(this.id, this.name, this.description, this.image, this.price);

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  @override
  List<Object?> get props => [id, name, description, image, price];
}