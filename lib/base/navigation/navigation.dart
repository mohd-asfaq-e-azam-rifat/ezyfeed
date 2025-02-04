import 'package:ezyfeed/data/model/local/exception/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension NavigationContextX on BuildContext {
  Map<String, String>? getArgs() {
    final args = ModalRoute.of(this)?.settings.arguments;
    return args is Map<String, String> ? args : null;
  }

  Future<T?> showBottomSheet<T>({
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    return showModalBottomSheet(
      context: this,
      builder: builder,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
    );
  }
}

extension UrlX on String {
  Future<bool> launchExternalUrl(BuildContext context) async {
    final url = Uri.tryParse(this);

    if (url != null) {
      try {
        return launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } on Exception catch (error) {
        final e = error.toString();
        return Future.error(
          AppException(
            "Could not launch the URL. "
            "${e.trim().isNotEmpty == true ? e.trim() : ""}",
          ),
        );
      }
    } else {
      return Future.error(AppException("Invalid URL found"));
    }
  }
}
