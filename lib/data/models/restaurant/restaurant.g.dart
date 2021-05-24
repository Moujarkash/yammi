// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    json['id'] as int,
    json['name'] as String,
    json['cuisine'] as String,
    json['rate'] as int,
    json['status'] as String,
    (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  );
}
