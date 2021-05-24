// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'application/bloc/auth/auth_bloc.dart' as _i15;
import 'application/bloc/confirm_phone/confirm_phone_bloc.dart' as _i16;
import 'application/bloc/restaurant_details/restaurant_details_bloc.dart'
    as _i12;
import 'application/bloc/restaurants/restaurants_bloc.dart' as _i13;
import 'application/bloc/sign_in/sign_in_bloc.dart' as _i14;
import 'core/utils/enviroment.dart' as _i4;
import 'data/datasources/local/user_local_datasource.dart' as _i6;
import 'data/datasources/remote/remote_data_source.dart' as _i7;
import 'data/repositories/auth_repository/auth_repository.dart' as _i9;
import 'data/repositories/auth_repository/i_auth_repository.dart' as _i8;
import 'data/repositories/restaurant_repository/i_restaurant_repository.dart'
    as _i10;
import 'data/repositories/restaurant_repository/restaurant_repository.dart'
    as _i11;
import 'injectable_module.dart' as _i17;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i4.Environment>(() => _i4.DevEnvironment(),
      registerFor: {_dev});
  await gh.lazySingletonAsync<_i5.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i6.UserLocalDatasource>(
      () => _i6.UserLocalDatasource(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i7.ApiClient>(
      () => _i7.ApiClient(get<_i3.Dio>(), get<_i4.Environment>()));
  gh.lazySingleton<_i8.IAuthRepository>(() =>
      _i9.AuthRepository(get<_i7.ApiClient>(), get<_i6.UserLocalDatasource>()));
  gh.lazySingleton<_i10.IRestaurantRepository>(
      () => _i11.RestaurantRepository(get<_i7.ApiClient>()));
  gh.factory<_i12.RestaurantDetailsBloc>(
      () => _i12.RestaurantDetailsBloc(get<_i10.IRestaurantRepository>()));
  gh.factory<_i13.RestaurantsBloc>(
      () => _i13.RestaurantsBloc(get<_i10.IRestaurantRepository>()));
  gh.factory<_i14.SignInBloc>(
      () => _i14.SignInBloc(get<_i8.IAuthRepository>()));
  gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(get<_i8.IAuthRepository>()));
  gh.factory<_i16.ConfirmPhoneBloc>(
      () => _i16.ConfirmPhoneBloc(get<_i8.IAuthRepository>()));
  return get;
}

class _$InjectableModule extends _i17.InjectableModule {}
