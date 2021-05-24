import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/data/datasources/remote/remote_data_source.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/core/errors/restaurant_failure.dart';
import 'package:yammi/data/repositories/restaurant_repository/i_restaurant_repository.dart';

@LazySingleton(as: IRestaurantRepository)
class RestaurantRepository implements IRestaurantRepository {
  final ApiClient _apiClient;

  RestaurantRepository(this._apiClient);

  @override
  Future<Either<RestaurantFailure, IList<Restaurant>>> getRestaurants() async {
    try {
      final restaurants = await _apiClient.getRestaurants();
      return right(IList.from(restaurants));
    } catch (error) {
      return left(const ServerError());
    } 
  }

  @override
  Future<Either<RestaurantFailure, IList<Menu>>> getRestaurantMenus(String restaurantId) async {
    try {
      final menus = await _apiClient.getRestaurantMenus(restaurantId);
      return right(IList.from(menus));
    } catch (error) {
      return left(const ServerError());
    } 
  }
}