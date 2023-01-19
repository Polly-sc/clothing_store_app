import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../core/errors/auth_errors.dart';

@immutable
class AuthorizationState {
  final bool isLoading;
  final AuthError? authError;

  const AuthorizationState({
    required this.isLoading,
    this.authError,
  });
}

//Вход в профиль
@immutable
class AppStateLoggedIn extends AuthorizationState {
  final String? userId;

  const AppStateLoggedIn({
    required this.userId,
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );

  @override
  bool operator ==(other) {
    final otherClass = other;
    if (otherClass is
    AppStateLoggedIn) {
      return isLoading == otherClass.isLoading &&
          userId == otherClass.userId;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => userId.hashCode;

  @override
  String toString() => 'AppStateLoggedIn';
}

//Выход из профиля
class AppStateLoggedOut extends AuthorizationState {
  const AppStateLoggedOut({
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );

  @override
  String toString() =>
      'AppStateLoggedOut, isLoading = $isLoading, authError = $authError';
}

//Регистрация
class AppStateRegistration extends AuthorizationState {
  const AppStateRegistration({
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );
}

