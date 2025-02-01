import 'dart:core';

import 'package:ezyfeed/base/app_config/app_config_state.dart';
import 'package:ezyfeed/ui/authentication/login/login_page.dart';
import 'package:ezyfeed/ui/feed/create_post/create_post_page.dart';
import 'package:ezyfeed/ui/home/home_page.dart';
import 'package:ezyfeed/ui/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const root = "root";
  static const login = "login";
  static const home = "home";
  static const createPost = "create-post";
}

class RoutePaths {
  static const root = "/";
  static const login = "/login";
  static const home = "/home";
  static const createPost = "create-post";
}

// GoRouter configuration
final router = GoRouter(
  navigatorKey: AppConfigState.appKey,
  initialLocation: RoutePaths.root,
  routes: [
    GoRoute(
      name: Routes.root,
      path: RoutePaths.root,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.login,
      path: RoutePaths.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: Routes.home,
      path: RoutePaths.home,
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: Routes.createPost,
          path: RoutePaths.createPost,
          builder: (context, state) => const CreatePostPage(),
        ),
      ],
    ),
  ],
);
