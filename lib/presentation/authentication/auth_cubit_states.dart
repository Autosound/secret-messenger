sealed class AuthState {}

class AuthIdle extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError({
    required this.error,
  });
}
