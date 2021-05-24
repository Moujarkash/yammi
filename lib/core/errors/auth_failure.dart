abstract class AuthFailure {
  const AuthFailure();
}

class ServerError implements AuthFailure {
  const ServerError();
}

class PhoneNumberNotCorrectError implements AuthFailure {
  const PhoneNumberNotCorrectError();
}

class VerificationCodeNotCorrectError implements AuthFailure {
  const VerificationCodeNotCorrectError();
}