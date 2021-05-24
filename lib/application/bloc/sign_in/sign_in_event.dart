part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends SignInEvent {
  final String phoneNumber;

  const LoginEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
