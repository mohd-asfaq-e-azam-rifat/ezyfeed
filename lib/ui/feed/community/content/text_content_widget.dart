part of '../feed_item_widget.dart';

class _TextContentWidget extends StatelessWidget {
  final FeedItem item;

  const _TextContentWidget({
    super.key,
    required this.item,
  });

  LinearGradient _getBackgroundGradient() {
    final defaultBackground = LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
    );

    var background = item.backgroundColor?.backgroundCssStyleToLinearGradient();
    return background ?? defaultBackground;
  }

  @override
  Widget build(BuildContext context) {
    TextSpan textSpan;
    final text = item.feedText ?? "";

    final RegExp linkRegExp = RegExp(
      Regex.linkRegex,
      caseSensitive: false,
    );

    final List<TextSpan> children = [];
    int startIndex = 0;

    final matches = linkRegExp.allMatches(text);

    for (final match in matches) {
      // Add the text before the link
      if (match.start > startIndex) {
        children.add(
          TextSpan(
            text: text.substring(startIndex, match.start),
            style: textStyleFeedItemBodyRegular,
          ),
        );
      }

      // Add the link
      final String url = match.group(0)!;
      children.add(
        TextSpan(
          text: url,
          style: textStyleFeedItemBodyLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              try {
                url.launchExternalUrl(context);
              } on Exception catch (e) {
                showToast(message: e.getErrorMessage());
              }
            },
        ),
      );

      startIndex = match.end;
    }

    // Add any remaining text after the last link
    if (startIndex < text.length) {
      children.add(
        TextSpan(
          text: text.substring(startIndex),
          style: textStyleFeedItemBodyRegular,
        ),
      );
    }

    textSpan = TextSpan(children: children);

    return item.backgroundColor != null
        ? Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: _getBackgroundGradient(),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: RichText(
        textScaler: MediaQuery.of(context).textScaler,
        text: textSpan,
        textAlign: TextAlign.start,
      ),
    )
        : RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: textSpan,
      textAlign: TextAlign.start,
    );
  }
}