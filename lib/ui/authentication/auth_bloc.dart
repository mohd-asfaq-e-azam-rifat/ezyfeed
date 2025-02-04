import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/repository/auth_repository.dart';
import 'package:ezyfeed/ui/authentication/auth_event.dart';
import 'package:ezyfeed/ui/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogOutRequested>(_onLogOutRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(uiState: UiState.loading));

      final result = await _authRepository.logIn(
        email: event.email,
        password: event.password,
      );

      if (result?.type != null && result?.token != null) {
        emit(LoggedInSuccessfully());
      } else {
        emit(
          state.copyWith(
            uiState: UiState.error,
            message: "Token malfunction found",
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          uiState: UiState.error,
          message: e.getErrorMessage(),
        ),
      );
    }
  }

  Future<void> _onLogOutRequested(
    LogOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(uiState: UiState.loading));

      await _authRepository.logOut();
      emit(LoggedOutSuccessfully());
    } on Exception catch (e) {
      emit(
        state.copyWith(
          uiState: UiState.error,
          message: e.getErrorMessage(),
        ),
      );
    }
  }

  bool isLoggedIn() {
    return _authRepository.isLoggedIn();
  }
}
