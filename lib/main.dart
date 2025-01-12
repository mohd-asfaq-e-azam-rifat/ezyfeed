import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/theme/light_theme.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use the following flag to handle debugging layout size visibility
    debugPaintSizeEnabled = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppConfigBloc>(
          create: (_) => getIt<AppConfigBloc>(),
        ),
      ],
      child: BlocBuilder<AppConfigBloc, AppConfigState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: AppConfigState.appKey,
            initialRoute: Routes.initialRoute,
            onGenerateRoute: onGenerateRoute,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
          );
        },
      ),
    );
  }
}
