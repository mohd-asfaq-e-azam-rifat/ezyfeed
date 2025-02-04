import 'package:equatable/equatable.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';

class AuthState extends Equatable {
  final UiState uiState;
  final String? message;

  const AuthState({
    this.uiState = UiState.initial,
    this.message,
  });

  AuthState copyWith({
    UiState? uiState,
    String? message,
  }) {
    return AuthState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        uiState,
        message,
      ];
}

class LoggedInSuccessfully extends AuthState {}

class LoggedOutSuccessfully extends AuthState {}
