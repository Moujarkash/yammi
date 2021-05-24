import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/data/repositories/auth_repository/i_auth_repository.dart';

part 'confirm_phone_event.dart';
part 'confirm_phone_state.dart';

@injectable
class ConfirmPhoneBloc extends Bloc<ConfirmPhoneEvent, ConfirmPhoneState> {
  final IAuthRepository _authRepository;

  ConfirmPhoneBloc(this._authRepository) : super(ConfirmPhoneInitial());

  @override
  Stream<ConfirmPhoneState> mapEventToState(
    ConfirmPhoneEvent event,
  ) async* {
    if (event is ConfirmationEvent) {
      yield Loading();

      final result = await _authRepository.confirmPhoneNumber(event.phoneNumber, event.pin);
      yield result.fold((failure) => FailedConfirmation(failure), (unit) => SuccessConfirmation());
    }
  }
}
