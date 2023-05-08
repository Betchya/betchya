import 'package:betchya/logic/API_calls.dart';
import 'package:betchya/logic/authentication/auth_repository/auth_repository.dart';
import 'package:betchya/presentation/views/profile_screen/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the Apple Login Button, we will send the AppleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<AppleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithApple();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the Facebook Login Button, we will send the FacebookSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<FacebookSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithFacebook();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });

    on<UserObjectWasRequested>((event, emit) async {
      emit(Loading());
      final response = await APIWrangler().getMe();
      if (response == null) {
        emit(AuthenticatedWithoutUserObject());
      } else {
        emit(AuthenticatedWithUserObject(response));
      }
    });

    on<RegisterName>((event, emit) async {
      emit(Loading());
      final response = await APIWrangler()
          .addMe(event.firstName, event.lastName, event.birthdate);
      if (response == null) {
        emit(AuthenticatedWithoutUserObject());
      } else {
        emit(AuthenticatedWithUserObject(response));
      }
    });
  }
}
