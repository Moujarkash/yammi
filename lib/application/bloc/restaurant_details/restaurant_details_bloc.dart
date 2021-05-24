import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/core/errors/restaurant_failure.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/data/repositories/restaurant_repository/i_restaurant_repository.dart';

part 'restaurant_details_event.dart';
part 'restaurant_details_state.dart';

@injectable
class RestaurantDetailsBloc extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  final IRestaurantRepository _restaurantRepository;
  
  RestaurantDetailsBloc(this._restaurantRepository) : super(RestaurantDetailsInitial());

  @override
  Stream<RestaurantDetailsState> mapEventToState(
    RestaurantDetailsEvent event,
  ) async* {
    if (event is GetRestaurantMenusEvent) {
      yield Loading();

      final result = await _restaurantRepository.getRestaurantMenus(event.restaurantId);
      yield result.fold((failure) => FetchFailure(failure), (menus) => FetchSuccess(menus));
    }
  }
}
