import 'dart:async';

import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  AppConfigBloc _getBloc(BuildContext context) {
    final bloc = context.read<AppConfigBloc>();
    bloc.add(AppInitialDataRequested());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getBloc(context),
      child: BlocConsumer<AppConfigBloc, AppConfigState>(
        listener: (context, state) {
          context.to(Routes.home, clearBackstack: true);
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: Text(
                  "Hello",
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// void navigateLazyToNextPage() {
//   context.to(Routes.home, clearBackstack: true);
//   return;
//   final appAuthState = context.read<AppConfigBloc>().state.authState;
//
//   Timer(
//     const Duration(seconds: 1),
//     () {
//       if (appAuthState.isAuthenticated) {
//         context.to(Routes.home, clearBackstack: true);
//       } else {
//         context.to(Routes.login, clearBackstack: true);
//       }
//     },
//   );
// }
}
