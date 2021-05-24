import 'package:dartz/dartz.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/data/models/user/user.dart';

abstract class IAuthRepository {
  User? getSignedInUser();

  Future<Either<AuthFailure, String>> login(String phoneNumber); 

  Future<Either<AuthFailure, Unit>> confirmPhoneNumber(String phoneNumber, String verficationCode);
}