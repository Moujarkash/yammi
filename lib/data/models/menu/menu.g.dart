// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    json['menu'] as String,
    (json['items'] as List<dynamic>)
        .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['image'] as String,
    json['price'] as String,
  );
}
