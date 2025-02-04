import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/ui/authentication/auth_bloc.dart';
import 'package:ezyfeed/ui/authentication/auth_event.dart';
import 'package:ezyfeed/ui/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }

          if (state is LoggedOutSuccessfully) {
            context.pop();
            showToast(message: "Logged out successfully");

            final globalBloc = context.read<AppConfigBloc>();
            globalBloc.add(UserAuthStateUpdated());
          }
        },
        builder: (context, state) {
          if (state.uiState.isLoading) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 100.0,
                child: Center(
                  child: BaseDataLoader(),
                ),
              ),
            );
          }

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Center(
              child: Text(
                "Logout",
                style: textStyleDialogTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                "Are you sure, you want to log out?",
                style: textStyleDialogSubtitle,
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: double.maxFinite,
                    height: 1.0,
                    color: colorDialogDivider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(LogOutRequested());
                          },
                          child: Text(
                            "Yes",
                            style: textStyleDialogAction,
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 56.0,
                        color: colorDialogDivider,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            "No",
                            style: textStyleDialogAction.copyWith(
                              color: colorDialogNegativeAction,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
