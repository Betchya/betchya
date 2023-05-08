part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with email and password this event is called and the [AuthRepository] is called to sign in the user
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  SignUpRequested(this.email, this.password);
}

// When the user signing in with google this event is called and the [AuthRepository] is called to sign in the user
class GoogleSignInRequested extends AuthEvent {}

// When the user signing in with apple this event is called and the [AuthRepository] is called to sign in the user
class AppleSignInRequested extends AuthEvent {}

// When the user signing in with facebook this event is called and the [AuthRepository] is called to sign in the user
class FacebookSignInRequested extends AuthEvent {}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequested extends AuthEvent {}

// When the user object was requested.
class UserObjectWasRequested extends AuthEvent {}

class RegisterName extends AuthEvent {
  final String firstName;
  final String lastName;
  final String birthdate;

  RegisterName(this.firstName, this.lastName, this.birthdate);
}
