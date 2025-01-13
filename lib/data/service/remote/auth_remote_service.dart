import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ezyfeed/base/di/app_module.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/local/exception/exceptions.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthRemoteService {
  final Dio _client;

  AuthRemoteService(this._client);

  Future<ApiResponse<void>?> requestForGoogleAuth(
    String googleSignInToken,
    String fcmToken,
  ) async {
    Response? response;

    try {
      response = await _client.postRequest(
        endPoint: urlLogin,
        data: {
          ApiKey.loginType: "GOOGLE",
          ApiKey.token: googleSignInToken,
          ApiKey.appPlatform: appInfo.platform?.name.toUpperCase(),
          ApiKey.deviceId: appInfo.deviceId,
          ApiKey.fcmToken: fcmToken,
        },
        requiresAuth: false,
      );
    } on AppException catch (e) {
      if (e.apiResponse?.code == HttpStatus.unauthorized) {
        // TODO: the following should be handled from back-end
        e.message = "Login failed, Please use exabyting email.";
        rethrow;
      } else {
        rethrow;
      }
    }

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => {},
          )
        : null;
  }

  Future<ApiResponse<Null>?> logIn({
    required String email,
    required String password,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlLogin,
      data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.appToken: "",
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => null,
          )
        : null;
  }

  Future<ApiResponse<void>?> logOut() async {
    final response = await _client.postRequest(
      endPoint: urlLogOut,
      data: {},
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => {},
          )
        : null;
  }
}
