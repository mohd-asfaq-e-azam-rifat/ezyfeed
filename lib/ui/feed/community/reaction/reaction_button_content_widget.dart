part of '../feed_item_widget.dart';

class _ReactionButtonContentWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color foregroundColor;
  final FontWeight fontWeight;
  final double fontSize;

  const _ReactionButtonContentWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.foregroundColor,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.0,
      height: 20.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20.0,
            height: 20.0,
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: fontFamilyFigtree,
                color: foregroundColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension ReactionX on String {
  Reaction<String> _prepareReactionButtonWidget() {
    return Reaction<String>(
      value: this,
      previewIcon: SvgPicture.asset(
        getReactionPreviewIconPath(),
      ),
      icon: _ReactionButtonContentWidget(
        iconPath: getReactionIconPath(),
        title: getReactionTitle(),
        foregroundColor: getReactionColor(),
      ),
    );
  }
}