import 'package:ezyfeed/base/di/app_module.dart';
import 'package:ezyfeed/base/log/debug_bloc_observer.dart';
import 'package:ezyfeed/injection.config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configurePreDependencies() async {
   await init(getIt);

  // Pass all uncaught errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Pass all uncaught asynchronous errors
  // that aren't handled by the Flutter framework to Crashlytics
  /*PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };*/

  if (appInfo.isDebugBuild() == true) {
    Bloc.observer = DebugBlocObserver();
  }
}

Future<void> configurePostDependencies() async {
  final packageInfoPlugin = await PackageInfo.fromPlatform();

  appInfo.appName = packageInfoPlugin.appName;
  appInfo.packageName = packageInfoPlugin.packageName;
  appInfo.versionName = packageInfoPlugin.version;
  appInfo.versionCode = packageInfoPlugin.buildNumber;

  final userAgent = "Aladin"
      "/${appInfo.versionName ?? ""}"
      "/${appInfo.platform?.name ?? ""}"
      "/${appInfo.platformVersion ?? ""}"
      "/${appInfo.deviceId ?? ""}"
      "/${appInfo.manufacturer ?? ""}"
      "_${appInfo.deviceModel ?? ""}";
  appInfo.userAgent = userAgent;
}