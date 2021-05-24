import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/data/datasources/local/user_local_datasource.dart';
import 'package:yammi/data/datasources/remote/remote_data_source.dart';
import 'package:yammi/data/models/user/user.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/data/repositories/auth_repository/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final ApiClient _apiClient;
  final UserLocalDatasource _userLocalDatasource;

  const AuthRepository(this._apiClient, this._userLocalDatasource);

  @override
  User? getSignedInUser() {
    return _userLocalDatasource.getStoredUser();
  }

  @override
  Future<Either<AuthFailure, String>> login(String phoneNumber) async {
    try {
      await _apiClient.login(phoneNumber);
    } catch (error) {
      if (error.runtimeType == DioError) {
        final dioError = error as DioError;
        if (dioError.response?.statusCode == 400) {
          return left(const PhoneNumberNotCorrectError());
        } else {
          return left(const ServerError());
        }
      } else {
        return left(const ServerError());
      }
    }

    return right(phoneNumber);
  }

  @override
  Future<Either<AuthFailure, Unit>> confirmPhoneNumber(
      String phoneNumber, String verficationCode) async {
    try {
      final user = await _apiClient.confirmPhoneNumber(phoneNumber, verficationCode);
      _userLocalDatasource.storeUser(user);
    } catch (error) {
      if (error.runtimeType == DioError) {
        final dioError = error as DioError;
        if (dioError.response?.statusCode == 400) {
          return left(const VerificationCodeNotCorrectError());
        } else {
          return left(const ServerError());
        }
      } else {
        return left(const ServerError());
      }
    }

    return right(unit);
  }
}
