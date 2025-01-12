import 'package:ezyfeed/data/provider/local/common_local_provider.dart';
import 'package:ezyfeed/data/provider/remote/common_remote_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class CommonRepository {
  final CommonLocalProvider _localProvider;
  final CommonRemoteProvider _remoteProvider;

  CommonRepository(this._localProvider, this._remoteProvider);

  Future<bool> isFirstTimeUser() async {
    final bool flag = _localProvider.isFirstTimeUser();
    if (flag == true) {
      await _localProvider.flagOldUser();
    }

    return flag;
  }

  Future<void> storeLanguage(Locale locale) {
    return _localProvider.storeLanguage(locale);
  }

  Locale? getLanguage() {
    return _localProvider.getLanguage();
  }

  Future<void> storeThemeMode(ThemeMode themeMode) {
    return _localProvider.storeThemeMode(themeMode);
  }

  ThemeMode? getThemeMode() {
    return _localProvider.getThemeMode();
  }

  Future<void> storeDestinationAfterLogin(String destinationAfterLogin) {
    return _localProvider.storeDestinationAfterLogin(destinationAfterLogin);
  }

  Future<String?> getDestinationAfterLogin() async {
    final destination = _localProvider.getDestinationAfterLogin();
    await _localProvider.clearDestinationAfterLogin();
    return destination;
  }
}
