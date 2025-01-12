import 'dart:io';

import 'package:ezyfeed/base/di/app_module.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/provider/local/auth_local_provider.dart';
import 'package:ezyfeed/data/provider/local/common_local_provider.dart';
import 'package:ezyfeed/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
@singleton
class BaseInterceptor extends Interceptor {
  late CommonLocalProvider _globalProvider;
  late AuthLocalProvider _authProvider;
  late Uuid _uuid;

  BaseInterceptor() {
    _uuid = const Uuid();
    _globalProvider = getIt<CommonLocalProvider>();
    _authProvider = getIt<AuthLocalProvider>();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _authProvider.getAuthToken();
    final language = _globalProvider.getLanguage()?.languageCode ?? 'en';
    final theme = _globalProvider.getThemeMode()?.name ?? ThemeMode.light.name;
    final requiresAuth =
        options.headers.remove(CustomHttpHeader.requiresAuth) as bool?;

    options.headers.addAll(
      {
        HttpHeaders.acceptHeader: CustomHttpHeaderValue.applicationJson,
        CustomHttpHeader.serviceName: CustomHttpHeaderValue.app,
        CustomHttpHeader.uuid: _uuid.v4(),
        CustomHttpHeader.theme: theme,
        HttpHeaders.userAgentHeader: appInfo.userAgent ?? "",
        HttpHeaders.acceptLanguageHeader: language,
        if (requiresAuth == true && accessToken != null)
          CustomHttpHeader.token: accessToken,
      },
    );
    super.onRequest(options, handler);
  }
}
