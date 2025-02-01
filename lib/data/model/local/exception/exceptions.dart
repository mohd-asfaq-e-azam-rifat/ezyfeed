import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';

class AppException implements Exception {
  String? message;
  ApiResponse<void>? apiResponse;

  AppException([this.message, this.apiResponse]);

  @override
  String toString() {
    return message
        ?.trim()
        .isNotEmpty == true ? "$message" : "";
  }
}