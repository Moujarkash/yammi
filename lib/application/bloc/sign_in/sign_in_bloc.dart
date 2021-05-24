import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/data/repositories/auth_repository/i_auth_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthRepository _authRepository;

  SignInBloc(this._authRepository) : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield Loading();
      final result = await _authRepository.login(event.phoneNumber);
      yield result.fold((failure) => FailedSignIn(failure), (phoneNumber) => SuccessLogin(phoneNumber));
    }
  }
}
