import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final int pageIndex;

  const HomePage({
    super.key,
    this.pageIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _indexCommunity = 0;
  static const _indexLogout = 1;

  late int _pageIndex;

  @override
  void initState() {
    _pageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Python Developer Community"),
        titleTextStyle: textStyleAppBarTitle,
        systemOverlayStyle: appBarTheme.systemOverlayStyle?.copyWith(
          systemNavigationBarColor: colorBottomBarBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: <Widget>[
        Container(color: Colors.redAccent),
        Container(color: Colors.greenAccent),
      ][_pageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          _onNavigationBarItemTapped(context, index);
        },
        selectedIndex: _pageIndex,
        destinations: <Widget>[
          BottomBarItemWidget(
            iconPath: "assets/icons/ic_community.svg",
            label: "Community",
            isSelected: _pageIndex == _indexCommunity,
          ),
          BottomBarItemWidget(
            iconPath: "assets/icons/ic_logout.svg",
            label: "Logout",
            isSelected: _pageIndex == _indexLogout,
          ),
        ],
      ),
    );
  }

  void _onNavigationBarItemTapped(BuildContext context, int index) {
    if (index == _indexLogout) {
      showDialog(
        context: context,
        builder: (context) => LogoutDialog(),
        barrierColor: colorBackgroundDim,
      );

      return;
    }

    setState(() {
      _pageIndex = index;
    });
  }
}

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
            context.back();
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LogOutRequested());
                        },
                        child: Text(
                          "Yes",
                          style: textStyleDialogAction,
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 56.0,
                        color: colorDialogDivider,
                      ),
                      TextButton(
                        onPressed: () {
                          context.back();
                        },
                        child: Text(
                          "No",
                          style: textStyleDialogAction.copyWith(
                            color: colorDialogNegativeAction,
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

class BottomBarItemWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const BottomBarItemWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        fit: BoxFit.contain,
        width: 24.0,
        height: 24.0,
        colorFilter: ColorFilter.mode(
          isSelected ? colorBottomBarSelected : colorBottomBarNotSelected,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
