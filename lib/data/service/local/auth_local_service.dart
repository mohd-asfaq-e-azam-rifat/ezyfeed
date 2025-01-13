import 'dart:convert' as json_converter;

import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/local/user/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthLocalService {
  // keys
  static const _keyAuthToken = "auth_token";
  static const _keyLastLoginTimestamp = "last_login_timestamp";
  static const _keyCurrentUser = "current_user";

  final GetStorage _box;

  AuthLocalService(this._box);

  Future<void> setAuthToken(String token) {
    return _box.writeStringSecured(
      _keyAuthToken,
      token,
    );
  }

  String? getAuthToken() {
    final authToken = _box.readStringSecured(_keyAuthToken);
    return authToken;
  }

  Future<void> clearAuthToken() {
    return _box.remove(_keyAuthToken);
  }

  Future<void> setLastLoginTimestamp(DateTime dateTime) {
    return _box.writeStringSecured(
      _keyLastLoginTimestamp,
      dateTime.toIso8601String(),
    );
  }

  DateTime? getLastLoginTimestamp() {
    final timestamp = _box.readStringSecured(_keyLastLoginTimestamp);
    return DateTime.tryParse(timestamp ?? "");
  }

  Future<void> clearLastLoginTimestamp() {
    return _box.remove(_keyLastLoginTimestamp);
  }

  Future<void> setCurrentUser(User user) {
    return _box.writeStringSecured(
      _keyCurrentUser,
      json_converter.jsonEncode(user.toJson()),
    );
  }

  User? getCurrentUser() {
    final jsonString = _box.readStringSecured(_keyCurrentUser);
    return jsonString?.trim().isNotEmpty == true
        ? User.fromJson(
            json_converter.jsonDecode(jsonString!),
          )
        : null;
  }

  Future<void> clearCurrentUser() {
    return _box.remove(_keyCurrentUser);
  }
}
