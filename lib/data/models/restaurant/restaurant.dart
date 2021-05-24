import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  final int id;
  final String name;
  final String cuisine;
  final int rate;
  final String status;
  final List<String> images;

  const Restaurant(this.id, this.name, this.cuisine, this.rate, this.status, this.images);

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}