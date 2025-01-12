import 'package:ezyfeed/data/extensions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class EmployeeLocalProvider {
  // keys
  static const _keyAuthToken = "auth_token";

  final GetStorage _box;

  EmployeeLocalProvider(this._box);

  Future<void> storeAuthToken(String token) {
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

/*  Future<void> storeLoginDetails(LoginResponse details) {
    return _box.writeStringSecured(
      _keyLoginDetails,
      jsonEncode(details.toJson()),
    );
  }

  LoginResponse? getLoginDetails() {
    final details = _box.readStringSecured(_keyLoginDetails);
    return details != null
        ? LoginResponse.fromJson(
            jsonDecode(details),
          )
        : null;
  }

  Future<void> clearLoginDetails() {
    return _box.remove(_keyLoginDetails);
  }*/
}
