part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

// When the user presses the sign-in or sign-up button the state is changed to loading.
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated but the User object hasn't been requested the state is changed to Authenticated.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated but does not exist with the API.
class AuthenticatedWithoutUserObject extends AuthState {
  @override
  List<Object?> get props => [];
}

/// When the user exists with the API and is authenticated.
class AuthenticatedWithUserObject extends AuthState {
  @override
  List<Object?> get props => [];
  final UserResponse user;

  AuthenticatedWithUserObject(this.user);
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}
