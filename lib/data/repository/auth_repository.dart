import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/local/user/user.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/provider/local/auth_local_provider.dart';
import 'package:ezyfeed/data/provider/remote/auth_remote_provider.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class AuthRepository {
  final AuthLocalProvider _localProvider;
  final AuthRemoteProvider _remoteProvider;

  AuthRepository(
    this._localProvider,
    this._remoteProvider,
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
    return _localProvider.setCurrentUser(user);
  }

  User? getCurrentUser() {
    return _localProvider.getCurrentUser();
  }

  String? getEmployeeId() {
    return getCurrentUser()?.employeeId;
  }

  Future<void> clearLocalSession() async {
    await _localProvider.clearAuthToken();
    await _localProvider.clearCurrentUser();
    await _localProvider.clearLastLoginTimestamp();
  }

  bool isLoggedIn() {
    return _localProvider.getAuthToken() != null;
  }

  UserAuthState getUserAuthState() {
    if (isLoggedIn() == true) {
      return UserAuthState.authenticated;
    } else {
      return UserAuthState.unauthenticated;
    }
  }
}
