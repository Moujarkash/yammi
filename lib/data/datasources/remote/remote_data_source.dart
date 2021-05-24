import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:retrofit/retrofit.dart';
import 'package:yammi/core/utils/enviroment.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';
import 'package:yammi/data/models/user/user.dart';

part 'remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: '')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, Environment environment) {
    return _ApiClient(dio, baseUrl: environment.getBaseUrl);
  }

  @POST('/api/v1/login')
  Future<void> login(
    @Field('phone_number') String phoneNumber,
  );

  @POST('/api/v1/login/otp')
  Future<User> confirmPhoneNumber(
    @Field('phone_number') String phoneNumber,
    @Field('otp') String verficationCode,
  );

  @GET('/api/v1/restaurants')
  Future<List<Restaurant>> getRestaurants();

  @GET('/api/v1/menus/restaurant/{restaurant_id}')
  Future<List<Menu>> getRestaurantMenus(
      @Path("restaurant_id") String restaurantId);
}
