import 'dart:core';

import 'package:ezyfeed/ui/authentication/login/login_page.dart';
import 'package:ezyfeed/ui/create_post/create_post_page.dart';
import 'package:ezyfeed/ui/home/home_page.dart';
import 'package:ezyfeed/ui/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static String initialRoute = Routes.root;

  static const root = "ezyfeed://";
  static const login = "ezyfeed://login";
  static const home = "ezyfeed://home";
  static const createPost = "ezyfeed://home/create-post";
}

List<String> get routes {
  return [
    Routes.root,
    Routes.login,
    Routes.home,
    Routes.createPost,
  ];
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  PageRoute<T> buildRoute<T>({
    required WidgetBuilder builder,
    bool isFullScreenDialog = false,
    bool isCancelable = false,
    bool isCupertino = false,
  }) {
    if (isCupertino == true) {
      return CupertinoPageRoute<T>(
        builder: builder,
        fullscreenDialog: isFullScreenDialog,
        barrierDismissible: isCancelable,
      );
    } else {
      return MaterialPageRoute<T>(
        builder: builder,
        fullscreenDialog: isFullScreenDialog,
        barrierDismissible: isCancelable,
      );
    }
  }

  if (settings.name == null) {
    return null;
  }

  switch (settings.name!) {
    case Routes.root:
      return buildRoute(
        builder: (_) => const SplashScreen(),
      );

    case Routes.login:
      return buildRoute(
        builder: (_) => const LoginPage(),
      );

    case Routes.home:
      return buildRoute(
        builder: (_) => const HomePage(),
      );

    case Routes.createPost:
      return buildRoute(
        builder: (_) => const CreatePostPage(),
      );

    default:
      return null;
  }
}
