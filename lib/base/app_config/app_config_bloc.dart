import 'dart:async';

import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/helper/async.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/local/user/user.dart';
import 'package:ezyfeed/data/repository/auth_repository.dart';
import 'package:ezyfeed/data/repository/common_repository.dart';
import 'package:ezyfeed/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final CommonRepository _commonRepository;
  final AuthRepository _authRepository;

  AppConfigBloc(this._commonRepository, this._authRepository)
      : super(
          AppConfigState(
            locale: _commonRepository.getLanguage() ?? const Locale("en"),
            themeMode: _commonRepository.getThemeMode() ?? ThemeMode.light,
            authState: _authRepository.getUserAuthState(),
          ),
        ) {
    on<UserAuthStateUpdated>(_onUserAuthStateUpdated);
    on<AppConfigDataRequested>(_onAppConfigDataRequested);
    on<AppInitialDataRequested>(_onAppInitialDataRequested);
  }

  Future<void> _onAppInitialDataRequested(
    AppConfigEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    await configurePostDependencies();

    final savedLocale = _commonRepository.getLanguage();
    if (savedLocale == null) {
      await _commonRepository.storeLanguage(state.locale);
    }

    final themeMode = _commonRepository.getThemeMode();
    if (themeMode == null) {
      await _commonRepository.storeThemeMode(state.themeMode);
    }

    await delay(milliseconds: 1000);

    emit(
      state.copyWith(
        uiState: UiState.successful,
        themeMode: themeMode,
        locale: savedLocale,
        authState: _authRepository.getUserAuthState(),
      ),
    );
  }

  Future<void> _onAppConfigDataRequested(
    AppConfigEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    final savedLocale = _commonRepository.getLanguage();
    if (savedLocale == null) {
      await _commonRepository.storeLanguage(state.locale);
    } else {
      emit(state.copyWith(locale: savedLocale));
    }

    final themeMode = _commonRepository.getThemeMode();
    if (themeMode == null) {
      await _commonRepository.storeThemeMode(state.themeMode);
    } else {
      emit(state.copyWith(themeMode: themeMode));
    }
  }

  Future<void> _onUserAuthStateUpdated(
    UserAuthStateUpdated event,
    Emitter<AppConfigState> emit,
  ) async {
    emit(
      state.copyWith(
        authState: _authRepository.getUserAuthState(),
      ),
    );
  }

  User? getCurrentUser() {
    return _authRepository.getCurrentUser();
  }
}
