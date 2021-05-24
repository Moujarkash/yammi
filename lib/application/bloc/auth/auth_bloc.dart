import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/data/models/user/user.dart';
import 'package:yammi/data/repositories/auth_repository/i_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const Initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthCheckRequested) {
      final user = _authRepository.getSignedInUser();
      if (user != null) {
        yield Authenticated(user);
      } else {
        yield const Unauthenticated();
      }
    }
  }
}
