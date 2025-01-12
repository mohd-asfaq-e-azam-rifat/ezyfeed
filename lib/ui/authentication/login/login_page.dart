import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/routes/routes.dart';
import 'package:ezyfeed/ui/authentication/auth_bloc.dart';
import 'package:ezyfeed/ui/authentication/auth_event.dart';
import 'package:ezyfeed/ui/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.isNotEmpty == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          } else if (state.uiState.isSuccessful == true) {
            context.read<AppConfigBloc>().add(UserAuthStateUpdated());
            context.replace(Routes.home);
          }
        },
        builder: (context, state) {
          if (state.uiState.isLoading || state.uiState.isSuccessful) {
            return const CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Welcome To Aladin"),
                centerTitle: true,
                backgroundColor: Colors.red,
              ),
              body: Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: const Text("Sign In with Google"),
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginViaGoogleRequested());
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
