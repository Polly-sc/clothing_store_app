import 'package:bloc/bloc.dart';
import 'package:clothing_store_app/features/registration/presentation/bloc/authorization_bloc_event.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/auth_errors.dart';
import '../../data/apis/authentication.dart';
import 'authorization_bloc_states.dart';

class AppBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final BaseAuth auth = Auth();

  AppBloc() : super(
   const AppStateLoggedOut(
        isLoading: false,
    ),
  ) {
    on<LogOutEvent>((event, emit) async {
      emit(
        const AppStateLoggedOut(
            isLoading: true,
        ),
      );
      await auth.signOut();
      emit(
        const AppStateLoggedOut(
          isLoading: false,
        ),
      );
    });
    on<LoginEvent>((event, emit) async {
      emit(
        const AppStateLoggedOut(
            isLoading: true,
        ),
      );
        final email = event.email;
        final password = event.password;
        final Either<FirebaseAuthException, String?> response = await auth.signIn(email, password);
        response.fold(
            (exceptionValue) => emit(
              AppStateLoggedOut(
                isLoading: false,
                authError:  AuthError.from(exceptionValue),
              ),
            ),
            (userId) => emit(
                AppStateLoggedIn(
                  userId: userId,
                  isLoading: false,
                )
            ),
        );
    });
    on<RegistrationEvent>((event, emit) async{
      emit(
        const AppStateRegistration(
            isLoading: true,
        ),
      );
        final email = event.email;
        final password = event.password;

        final response = await auth.signUp(email, password);
        response.fold(
            (exceptionValue) => emit(
          const AppStateRegistration(
            isLoading: true,
          ),
        ),
            (userId) => emit(
            AppStateLoggedIn(
              userId: userId,
              isLoading: false,
            )
        ),
      );
    });
    on<InitializeEvent>((event, emit) async{
        final userId = await auth.getCurrentUser();
        if (userId == null) {
          emit(
              AppStateLoggedOut(
                  isLoading: false,
              ),
          );
        } else {
          emit(
            AppStateLoggedIn(
                userId: userId,
                isLoading: false,
            )
          );
        }
    });
  }

}