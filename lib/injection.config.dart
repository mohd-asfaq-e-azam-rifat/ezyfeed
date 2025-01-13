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
import 'package:ezyfeed/data/repository/auth_repository.dart' as _i244;
import 'package:ezyfeed/data/repository/common_repository.dart' as _i934;
import 'package:ezyfeed/data/repository/leave_repository.dart' as _i1045;
import 'package:ezyfeed/data/service/local/auth_local_service.dart' as _i245;
import 'package:ezyfeed/data/service/local/common_local_service.dart' as _i1058;
import 'package:ezyfeed/data/service/local/leave_local_service.dart' as _i612;
import 'package:ezyfeed/data/service/remote/auth_remote_service.dart' as _i702;
import 'package:ezyfeed/data/service/remote/common_remote_service.dart'
    as _i935;
import 'package:ezyfeed/data/service/remote/leave_remote_service.dart' as _i932;
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
  gh.factory<_i612.LeaveLocalService>(() => _i612.LeaveLocalService());
  gh.factory<_i935.CommonRemoteService>(() => _i935.CommonRemoteService());
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
  gh.factory<_i1058.CommonLocalService>(
      () => _i1058.CommonLocalService(gh<_i792.GetStorage>()));
  gh.factory<_i245.AuthLocalService>(
      () => _i245.AuthLocalService(gh<_i792.GetStorage>()));
  gh.factory<_i932.LeaveRemoteService>(
      () => _i932.LeaveRemoteService(gh<_i361.Dio>()));
  gh.factory<_i702.AuthRemoteService>(
      () => _i702.AuthRemoteService(gh<_i361.Dio>()));
  gh.factory<_i244.AuthRepository>(() => _i244.AuthRepository(
        gh<_i245.AuthLocalService>(),
        gh<_i702.AuthRemoteService>(),
      ));
  gh.factory<_i1045.LeaveRepository>(() => _i1045.LeaveRepository(
        gh<_i612.LeaveLocalService>(),
        gh<_i932.LeaveRemoteService>(),
      ));
  gh.factory<_i934.CommonRepository>(() => _i934.CommonRepository(
        gh<_i1058.CommonLocalService>(),
        gh<_i935.CommonRemoteService>(),
      ));
  gh.factory<_i36.AuthBloc>(() => _i36.AuthBloc(gh<_i244.AuthRepository>()));
  gh.factory<_i1067.AppConfigBloc>(() => _i1067.AppConfigBloc(
        gh<_i934.CommonRepository>(),
        gh<_i244.AuthRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i824.AppModule {}
