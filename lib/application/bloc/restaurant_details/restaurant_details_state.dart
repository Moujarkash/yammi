part of 'restaurant_details_bloc.dart';

abstract class RestaurantDetailsState extends Equatable {
  const RestaurantDetailsState();
  
  @override
  List<Object> get props => [];
}

class RestaurantDetailsInitial extends RestaurantDetailsState {}

class Loading extends RestaurantDetailsState {}

class FetchFailure extends RestaurantDetailsState {
  final RestaurantFailure failure;

  const FetchFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class FetchSuccess extends RestaurantDetailsState {
  final IList<Menu> menus;

  const FetchSuccess(this.menus);

  @override
  List<Object> get props => [menus];
}
