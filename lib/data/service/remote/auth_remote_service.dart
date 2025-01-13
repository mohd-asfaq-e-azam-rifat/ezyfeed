import 'package:dio/dio.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthRemoteService {
  final Dio _client;

  AuthRemoteService(this._client);

  Future<ApiResponse<void>?> logIn({
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
      requiresAuth: false,
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) {},
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
