import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/core/errors/restaurant_failure.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';
import 'package:yammi/data/repositories/restaurant_repository/i_restaurant_repository.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

@injectable
class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final IRestaurantRepository _restaurantRepository;

  RestaurantsBloc(this._restaurantRepository) : super(RestaurantsInitial());

  @override
  Stream<RestaurantsState> mapEventToState(
    RestaurantsEvent event,
  ) async* {
    if (event is GetRestaurantsEvent) {
      yield Loading();

      final result = await _restaurantRepository.getRestaurants();
      yield result.fold((failure) => FetchFailure(failure), (restaurants) => FetchSuccess(restaurants));
    }
  }
}
