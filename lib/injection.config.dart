// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ezyfeed/base/app_config/app_config_bloc.dart' as _i1067;
import 'package:ezyfeed/base/di/app_module.dart' as _i824;
import 'package:ezyfeed/base/helper/debouncer.dart' as _i59;
import 'package:ezyfeed/data/helper/encryption/encryption_helper.dart' as _i116;
import 'package:ezyfeed/data/helper/network/interceptors.dart' as _i308;
import 'package:ezyfeed/data/model/local/app_info/app_info.dart' as _i513;
import 'package:ezyfeed/data/provider/local/auth_local_provider.dart' as _i559;
import 'package:ezyfeed/data/provider/local/common_local_provider.dart'
    as _i269;
import 'package:ezyfeed/data/provider/local/employee_local_provider.dart'
    as _i384;
import 'package:ezyfeed/data/provider/local/leave_local_provider.dart'
    as _i1055;
import 'package:ezyfeed/data/provider/remote/auth_remote_provider.dart'
    as _i979;
import 'package:ezyfeed/data/provider/remote/common_remote_provider.dart'
    as _i690;
import 'package:ezyfeed/data/provider/remote/employee_remote_provider.dart'
    as _i992;
import 'package:ezyfeed/data/provider/remote/leave_remote_provider.dart'
    as _i325;
import 'package:ezyfeed/data/repository/auth_repository.dart' as _i244;
import 'package:ezyfeed/data/repository/common_repository.dart' as _i934;
import 'package:ezyfeed/data/repository/leave_repository.dart' as _i1045;
import 'package:ezyfeed/ui/authentication/auth_bloc.dart' as _i36;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i1055.LeaveLocalProvider>(() => _i1055.LeaveLocalProvider());
  gh.factory<_i690.CommonRemoteProvider>(() => _i690.CommonRemoteProvider());
  gh.factory<_i116.EncryptionHelper>(() => _i116.EncryptionHelper());
  gh.factory<_i308.BaseInterceptor>(() => _i308.BaseInterceptor());
  await gh.factoryAsync<_i792.GetStorage>(
    () => appModule.getStorage,
    preResolve: true,
  );
  await gh.factoryAsync<_i513.AppInfo>(
    () => appModule.appInfo,
    preResolve: true,
  );
  gh.factory<_i361.Dio>(() => appModule.dioClient);
  gh.factory<_i59.Debouncer>(() => _i59.Debouncer());
  gh.factory<_i269.CommonLocalProvider>(
      () => _i269.CommonLocalProvider(gh<_i792.GetStorage>()));
  gh.factory<_i559.AuthLocalProvider>(
      () => _i559.AuthLocalProvider(gh<_i792.GetStorage>()));
  gh.factory<_i384.EmployeeLocalProvider>(
      () => _i384.EmployeeLocalProvider(gh<_i792.GetStorage>()));
  gh.factory<_i992.EmployeeRemoteProvider>(
      () => _i992.EmployeeRemoteProvider(gh<_i361.Dio>()));
  gh.factory<_i325.LeaveRemoteProvider>(
      () => _i325.LeaveRemoteProvider(gh<_i361.Dio>()));
  gh.factory<_i979.AuthRemoteProvider>(
      () => _i979.AuthRemoteProvider(gh<_i361.Dio>()));
  gh.factory<_i1045.LeaveRepository>(() => _i1045.LeaveRepository(
        gh<_i1055.LeaveLocalProvider>(),
        gh<_i325.LeaveRemoteProvider>(),
      ));
  gh.factory<_i934.CommonRepository>(() => _i934.CommonRepository(
        gh<_i269.CommonLocalProvider>(),
        gh<_i690.CommonRemoteProvider>(),
      ));
  gh.factory<_i244.AuthRepository>(() => _i244.AuthRepository(
        gh<_i559.AuthLocalProvider>(),
        gh<_i979.AuthRemoteProvider>(),
      ));
  gh.factory<_i36.AuthBloc>(() => _i36.AuthBloc(gh<_i244.AuthRepository>()));
  gh.factory<_i1067.AppConfigBloc>(() => _i1067.AppConfigBloc(
        gh<_i934.CommonRepository>(),
        gh<_i244.AuthRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i824.AppModule {}
