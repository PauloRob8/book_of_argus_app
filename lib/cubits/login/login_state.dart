import 'package:equatable/equatable.dart';

enum LoginError {
  none,
  emptyEmail,
  emptyPassword,
  invalidPassword,
  invalidEmail,
  userNotFound,
}

class LoginState extends Equatable {
  const LoginState({
    required this.isLoading,
    required this.userdId,
    required this.logout,
    required this.errorType,
  });

  final bool isLoading;
  final String userdId;
  final bool logout;
  final LoginError errorType;

  factory LoginState.initial() => const LoginState(
        isLoading: false,
        userdId: '',
        logout: false,
        errorType: LoginError.none,
      );

  factory LoginState.loading() => const LoginState(
        isLoading: true,
        userdId: '',
        logout: false,
        errorType: LoginError.none,
      );

  factory LoginState.success({
    required String userId,
  }) =>
      LoginState(
        isLoading: false,
        userdId: userId,
        logout: false,
        errorType: LoginError.none,
      );

  factory LoginState.logout() => const LoginState(
        isLoading: false,
        userdId: '',
        logout: true,
        errorType: LoginError.none,
      );

  factory LoginState.error({
    required LoginError errorType,
  }) =>
      LoginState(
        isLoading: false,
        userdId: '',
        logout: false,
        errorType: errorType,
      );

  @override
  List<Object?> get props => [
        isLoading,
        userdId,
        errorType,
      ];
}
