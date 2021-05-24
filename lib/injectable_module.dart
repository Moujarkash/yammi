import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repositories/auth_repository/i_auth_repository.dart';
import 'injection.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioInstance {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        Map<String, String> headers;
        
        final user = getIt<IAuthRepository>().getSignedInUser();
        if (user != null) {
          headers = {'Authorization': user.accessToken};
          request.headers.addAll(headers);
        }

        return handler.next(request);
    }));

    return dio;
  }

  @preResolve
  @lazySingleton 
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
