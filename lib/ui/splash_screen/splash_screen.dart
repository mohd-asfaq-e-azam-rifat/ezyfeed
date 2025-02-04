import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  AppConfigBloc _getBloc(BuildContext context) {
    final bloc = context.read<AppConfigBloc>();
    bloc.add(AppInitialDataRequested());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return BlocProvider.value(
      value: _getBloc(context),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: colorBackground1,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: const Border(),
          toolbarHeight: 0.0,
          backgroundColor: colorBackground1,
          elevation: 0.0,
          systemOverlayStyle: appBarTheme.systemOverlayStyle?.copyWith(
            systemNavigationBarColor: colorBackground1,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 48.0,
            children: [
              SvgPicture.asset(
                "assets/icons/ic_short_logo.svg",
                width: 56.0,
                height: 41.0,
                fit: BoxFit.cover,
              ),
              BaseDataLoader(customColor: colorWhite),
            ],
          ),
        ),
      ),
    );
  }
}
