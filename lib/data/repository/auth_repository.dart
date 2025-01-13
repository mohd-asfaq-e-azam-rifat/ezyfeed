import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/local/user/user.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/service/local/auth_local_service.dart';
import 'package:ezyfeed/data/service/remote/auth_remote_service.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;

  AuthRepository(this._localService,
      this._remoteService,
  );

  Future<ApiResponse<void>?> requestForGoogleAuth() async {
    return null;
  }

  Future<void> logOut() async {
    // TODO: [auth] fix logging out from remote
    //final response = await _remoteProvider.logOut();

    // clear local state
    await clearLocalSession();

    // log out from 3rd parties

    // update app states and navigation
    final context = AppConfigState.appKey.currentContext;
    context?.read<AppConfigBloc>().add(UserAuthStateUpdated());
    context?.to(Routes.root, clearBackstack: true);
  }

  Future<void> setCurrentUser(User user) {
    return _localService.setCurrentUser(user);
  }

  User? getCurrentUser() {
    return _localService.getCurrentUser();
  }

  String? getEmployeeId() {
    return getCurrentUser()?.employeeId;
  }

  Future<void> clearLocalSession() async {
    await _localService.clearAuthToken();
    await _localService.clearCurrentUser();
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
