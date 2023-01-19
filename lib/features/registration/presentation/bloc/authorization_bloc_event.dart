import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthorizationEvent {
  const AuthorizationEvent();
}

//Пользователь отправил форму для входа
@immutable
class LoginEvent implements AuthorizationEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password
  });
}

//Пользователь нажал на кнопку зарегестрироваться
@immutable
class RegistrationEvent implements AuthorizationEvent{
  final String email;
  final String password;

  const RegistrationEvent({
    required this.email,
    required this.password
  });
}

//Пользователь вышел из аккаунта
@immutable
class LogOutEvent implements AuthorizationEvent{
  const LogOutEvent();
}

//Перейти на главную страницу приложения
@immutable
class UploadMainPageEvent implements AuthorizationEvent {
  final String filePathToUpload;

  const UploadMainPageEvent({
    required this.filePathToUpload,
  });
}

@immutable
class InitializeEvent implements AuthorizationEvent {
  const InitializeEvent();
}

