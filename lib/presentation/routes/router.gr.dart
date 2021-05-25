// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../data/models/restaurant/restaurant.dart' as _i8;
import '../pages/confirm_phone_page.dart' as _i5;
import '../pages/restaurant_details_page.dart' as _i7;
import '../pages/restaurants_page.dart' as _i6;
import '../pages/sign_in_page.dart' as _i4;
import '../pages/splash_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    SignInPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SignInPage();
        }),
    ConfirmPhonePageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConfirmPhonePageRouteArgs>();
          return _i5.ConfirmPhonePage(args.phoneNumber, key: args.key);
        }),
    RestaurantsPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.RestaurantsPage();
        }),
    RestaurantDetailsPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RestaurantDetailsPageRouteArgs>();
          return _i7.RestaurantDetailsPage(args.restaurant, key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPageRoute.name, path: '/'),
        _i1.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(ConfirmPhonePageRoute.name,
            path: '/confirm-phone-page'),
        _i1.RouteConfig(RestaurantsPageRoute.name, path: '/restaurants-page'),
        _i1.RouteConfig(RestaurantDetailsPageRoute.name,
            path: '/restaurant-details-page')
      ];
}

class SplashPageRoute extends _i1.PageRouteInfo {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

class SignInPageRoute extends _i1.PageRouteInfo {
  const SignInPageRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

class ConfirmPhonePageRoute
    extends _i1.PageRouteInfo<ConfirmPhonePageRouteArgs> {
  ConfirmPhonePageRoute({required String phoneNumber, _i2.Key? key})
      : super(name,
            path: '/confirm-phone-page',
            args:
                ConfirmPhonePageRouteArgs(phoneNumber: phoneNumber, key: key));

  static const String name = 'ConfirmPhonePageRoute';
}

class ConfirmPhonePageRouteArgs {
  const ConfirmPhonePageRouteArgs({required this.phoneNumber, this.key});

  final String phoneNumber;

  final _i2.Key? key;
}

class RestaurantsPageRoute extends _i1.PageRouteInfo {
  const RestaurantsPageRoute() : super(name, path: '/restaurants-page');

  static const String name = 'RestaurantsPageRoute';
}

class RestaurantDetailsPageRoute
    extends _i1.PageRouteInfo<RestaurantDetailsPageRouteArgs> {
  RestaurantDetailsPageRoute({required _i8.Restaurant restaurant, _i2.Key? key})
      : super(name,
            path: '/restaurant-details-page',
            args: RestaurantDetailsPageRouteArgs(
                restaurant: restaurant, key: key));

  static const String name = 'RestaurantDetailsPageRoute';
}

class RestaurantDetailsPageRouteArgs {
  const RestaurantDetailsPageRouteArgs({required this.restaurant, this.key});

  final _i8.Restaurant restaurant;

  final _i2.Key? key;
}
