part of 'confirm_phone_bloc.dart';

abstract class ConfirmPhoneState extends Equatable {
  const ConfirmPhoneState();
  
  @override
  List<Object> get props => [];
}

class ConfirmPhoneInitial extends ConfirmPhoneState {}

class Loading extends ConfirmPhoneState {}

class FailedConfirmation extends ConfirmPhoneState {
  final AuthFailure authFailure;

  const FailedConfirmation(this.authFailure);

  @override
  List<Object> get props => [authFailure];
}

class SuccessConfirmation extends ConfirmPhoneState {}
