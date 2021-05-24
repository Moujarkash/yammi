part of 'restaurants_bloc.dart';

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();
  
  @override
  List<Object> get props => [];
}

class RestaurantsInitial extends RestaurantsState {}

class Loading extends RestaurantsState {}

class FetchFailure extends RestaurantsState {
  final RestaurantFailure failure;

  const FetchFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class FetchSuccess extends RestaurantsState {
  final IList<Restaurant> restaurants;

  const FetchSuccess(this.restaurants);

  @override
  List<Object> get props => [restaurants];
}
