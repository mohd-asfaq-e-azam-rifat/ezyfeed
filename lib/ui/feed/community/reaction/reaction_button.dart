part of '../feed_item_widget.dart';

class _MyReactionButton extends StatefulWidget {
  final FeedItem item;

  const _MyReactionButton({
    super.key,
    required this.item,
  });

  @override
  State<_MyReactionButton> createState() => _MyReactionButtonState();
}

class _MyReactionButtonState extends State<_MyReactionButton> {
  // Reaction
  late DebounceHelper _reactionDebounceHelper;

  @override
  void initState() {
    _reactionDebounceHelper = getIt<DebounceHelper>();
    super.initState();
  }

  @override
  void dispose() {
    _reactionDebounceHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget reactionButton;
    final noReactionPlaceholder = Reaction<String>(
      value: null,
      icon: _ReactionButtonContentWidget(
        iconPath: "assets/icons/ic_like_outlined.svg",
        title: "Like",
        foregroundColor: colorNoReaction,
        fontWeight: FontWeight.w600,
      ),
    );

    String? lastReaction = widget.item.myReaction?.reactionType?.toReactionKey();

    final onClickReaction = lastReaction?._prepareReactionButtonWidget() ??
        UserReaction.like._prepareReactionButtonWidget();

    reactionButton = BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        return ReactionButton<String>(
          onReactionChanged: (Reaction<String>? reaction) {
            _reactionDebounceHelper.run(() {
              // Invalid case
              if (widget.item.id == null) {
                return;
              }

              // Other cases
              String updatedReaction;

              if (lastReaction == null && reaction?.value == null) {
                // No reaction at both time
                return;
              } else if (lastReaction == null && reaction?.value != null) {
                updatedReaction = reaction!.value!;
              } else if (lastReaction != null && reaction?.value == null) {
                // We will send the last reaction as API demands to undo it
                updatedReaction = lastReaction;
              } else {
                if (lastReaction == reaction?.value) {
                  // Same reaction at both time
                  return;
                } else {
                  updatedReaction = reaction!.value!;
                }
              }

              final feedBloc = context.read<FeedBloc>();
              feedBloc.add(
                ReactionRequested(
                  feedId: widget.item.id!,
                  reaction: updatedReaction,
                ),
              );
            }, milliseconds: 700);
          },
          reactions: <Reaction<String>>[
            UserReaction.like._prepareReactionButtonWidget(),
            UserReaction.love._prepareReactionButtonWidget(),
            UserReaction.care._prepareReactionButtonWidget(),
            UserReaction.haha._prepareReactionButtonWidget(),
            UserReaction.wow._prepareReactionButtonWidget(),
            UserReaction.sad._prepareReactionButtonWidget(),
            UserReaction.angry._prepareReactionButtonWidget(),
          ],
          selectedReaction: onClickReaction,
          itemSize: const Size.square(32.0),
          placeholder: noReactionPlaceholder,
          isChecked: widget.item.hasMyReaction,
        );
      },
    );

    return reactionButton;
  }
}
