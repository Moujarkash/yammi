part of 'confirm_phone_bloc.dart';

abstract class ConfirmPhoneEvent extends Equatable {
  const ConfirmPhoneEvent();

  @override
  List<Object> get props => [];
}

class ConfirmationEvent extends ConfirmPhoneEvent {
  final String phoneNumber;
  final String pin;

  const ConfirmationEvent(this.phoneNumber, this.pin);

  @override
  List<Object> get props => [phoneNumber, pin];
}
