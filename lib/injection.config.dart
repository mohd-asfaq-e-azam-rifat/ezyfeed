// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:ezyfeed/base/app_config/app_config_bloc.dart' as _i1067;
import 'package:ezyfeed/base/di/app_module.dart' as _i824;
import 'package:ezyfeed/base/helper/debounce.dart' as _i908;
import 'package:ezyfeed/data/helper/date_time/date_time_helper.dart' as _i857;
import 'package:ezyfeed/data/helper/encryption/encryption_helper.dart' as _i116;
import 'package:ezyfeed/data/helper/network/interceptors.dart' as _i308;
import 'package:ezyfeed/data/model/local/app_info/app_info.dart' as _i513;
import 'package:ezyfeed/data/repository/auth_repository.dart' as _i244;
import 'package:ezyfeed/data/repository/common_repository.dart' as _i934;
import 'package:ezyfeed/data/repository/feed_repository.dart' as _i592;
import 'package:ezyfeed/data/service/local/auth_local_service.dart' as _i245;
import 'package:ezyfeed/data/service/local/common_local_service.dart' as _i1058;
import 'package:ezyfeed/data/service/local/feed_local_service.dart' as _i282;
import 'package:ezyfeed/data/service/remote/auth_remote_service.dart' as _i702;
import 'package:ezyfeed/data/service/remote/common_remote_service.dart'
    as _i935;
import 'package:ezyfeed/data/service/remote/feed_remote_service.dart' as _i317;
import 'package:ezyfeed/ui/authentication/auth_bloc.dart' as _i36;
import 'package:ezyfeed/ui/feed/feed_bloc.dart' as _i797;
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
  gh.factory<_i935.CommonRemoteService>(() => _i935.CommonRemoteService());
  gh.factory<_i116.EncryptionHelper>(() => _i116.EncryptionHelper());
  gh.factory<_i308.BaseInterceptor>(() => _i308.BaseInterceptor());
  gh.factory<_i857.DateTimeHelper>(() => _i857.DateTimeHelper());
  await gh.factoryAsync<_i792.GetStorage>(
    () => appModule.getStorage,
    preResolve: true,
  );
  await gh.factoryAsync<_i833.AndroidDeviceInfo>(
    () => appModule.androidInfo,
    preResolve: true,
  );
  await gh.factoryAsync<_i513.AppInfo>(
    () => appModule.appInfo,
    preResolve: true,
  );
  gh.factory<_i361.Dio>(() => appModule.dioClient);
  gh.factory<_i908.DebounceHelper>(() => _i908.DebounceHelper());
  gh.factory<_i1058.CommonLocalService>(
      () => _i1058.CommonLocalService(gh<_i792.GetStorage>()));
  gh.factory<_i245.AuthLocalService>(
      () => _i245.AuthLocalService(gh<_i792.GetStorage>()));
  gh.factory<_i282.FeedLocalService>(
      () => _i282.FeedLocalService(gh<_i792.GetStorage>()));
  gh.factory<_i317.FeedRemoteService>(
      () => _i317.FeedRemoteService(gh<_i361.Dio>()));
  gh.factory<_i702.AuthRemoteService>(
      () => _i702.AuthRemoteService(gh<_i361.Dio>()));
  gh.factory<_i244.AuthRepository>(() => _i244.AuthRepository(
        gh<_i245.AuthLocalService>(),
        gh<_i702.AuthRemoteService>(),
      ));
  gh.factory<_i934.CommonRepository>(() => _i934.CommonRepository(
        gh<_i1058.CommonLocalService>(),
        gh<_i935.CommonRemoteService>(),
      ));
  gh.factory<_i592.FeedRepository>(() => _i592.FeedRepository(
        gh<_i282.FeedLocalService>(),
        gh<_i317.FeedRemoteService>(),
      ));
  gh.factory<_i36.AuthBloc>(() => _i36.AuthBloc(gh<_i244.AuthRepository>()));
  gh.factory<_i797.FeedBloc>(() => _i797.FeedBloc(gh<_i592.FeedRepository>()));
  gh.factory<_i1067.AppConfigBloc>(() => _i1067.AppConfigBloc(
        gh<_i934.CommonRepository>(),
        gh<_i244.AuthRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i824.AppModule {}
