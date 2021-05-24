part of 'restaurant_details_bloc.dart';

abstract class RestaurantDetailsEvent extends Equatable {
  const RestaurantDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetRestaurantMenusEvent extends RestaurantDetailsEvent {
  final String restaurantId;

  const GetRestaurantMenusEvent(this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}
