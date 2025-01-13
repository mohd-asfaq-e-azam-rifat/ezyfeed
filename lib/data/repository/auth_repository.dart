import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/service/local/auth_local_service.dart';
import 'package:ezyfeed/data/service/remote/auth_remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;

  AuthRepository(
    this._localService,
    this._remoteService,
  );

  Future<ApiResponse<void>?> logIn({
    required String email,
    required String password,
  }) async {
    final response = await _remoteService.logIn(
      email: email,
      password: password,
    );

    if (response?.type != null && response?.token != null) {
      _localService.setAuthToken("${response!.type!} ${response.token!}");
      _localService.setLastLoginTimestamp(DateTime.now());
    }

    return response;
  }

  Future<ApiResponse<void>?> logOut() async {
    final response = await _remoteService.logOut();

    // clear local state
    await clearLocalSession();

    return response;
  }

  Future<void> clearLocalSession() async {
    await _localService.clearAuthToken();
    await _localService.clearLastLoginTimestamp();
  }

  bool isLoggedIn() {
    return _localService.getAuthToken() != null;
  }

  UserAuthState getUserAuthState() {
    if (isLoggedIn() == true) {
      return UserAuthState.authenticated;
    } else {
      return UserAuthState.unauthenticated;
    }
  }
}
