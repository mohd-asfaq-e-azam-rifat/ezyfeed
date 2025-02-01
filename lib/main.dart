import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/di/app_module.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/theme/light_theme.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:ezyfeed/ui/feed/feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurePreDependencies();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    // Use the following flag to handle debugging layout size visibility
    debugPaintSizeEnabled = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppConfigBloc>(
          create: (_) => getIt<AppConfigBloc>(),
        ),
        BlocProvider<FeedBloc>(
          create: (_) => getIt<FeedBloc>(),
        ),
      ],
      child: BlocConsumer<AppConfigBloc, AppConfigState>(
        listener: (context, state) {
          if (state.authState.isAuthenticated == true) {
            appContext?.goNamed(Routes.home);
          } else {
            appContext?.goNamed(Routes.login);
          }
        },
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
          );
        },
      ),
    );
  }
}
