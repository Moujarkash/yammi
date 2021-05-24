import 'package:dartz/dartz.dart';
import 'package:yammi/core/errors/restaurant_failure.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';

abstract class IRestaurantRepository {
  Future<Either<RestaurantFailure, IList<Restaurant>>> getRestaurants();

  Future<Either<RestaurantFailure, IList<Menu>>> getRestaurantMenus(String restaurantId);
}