part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class Loading extends SignInState {}

class FailedSignIn extends SignInState {
  final AuthFailure authFailure;

  const FailedSignIn(this.authFailure);

  @override
  List<Object> get props => [authFailure];
}

class SuccessLogin extends SignInState {
  final String phoneNumber;

  const SuccessLogin(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
