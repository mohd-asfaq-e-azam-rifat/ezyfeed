import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/base/widget/loader/refresh_indicator_wrapper.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/data/model/local/pagination_data/pagination_data.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:ezyfeed/ui/feed/community/content/write_for_feed_widget.dart';
import 'package:ezyfeed/ui/feed/community/feed_item_widget.dart';
import 'package:ezyfeed/ui/feed/feed_bloc.dart';
import 'package:ezyfeed/ui/feed/feed_event.dart';
import 'package:ezyfeed/ui/feed/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late final ScrollController _scrollController;
  late bool _isLoadingPaginatedData;

  @override
  void initState() {
    _scrollController = ScrollController();
    _isLoadingPaginatedData = false;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  FeedBloc _getBloc(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    bloc.add(FeedItemsRequested());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>.value(
      value: _getBloc(context),
      child: BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {
          if (state is GetFeedState && state.uiState.isSuccessful ||
              state.uiState.isError ||
              state.uiState.isEmpty) {
            // we're turning off the flag as we just got the data
            _isLoadingPaginatedData = false;
          }

          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }

          if (state is CreatePostState && state.uiState.isSuccessful == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }

            final bloc = context.read<FeedBloc>();
            bloc.add(FeedItemsRequested());
          }
        },
        builder: (context, state) {
          if (state is GetFeedState && state.uiState.isLoading == true) {
            return Column(
              spacing: 24.0,
              children: [
                WriteForFeedWidget(),
                Expanded(
                  child: Center(
                    child: BaseDataLoader(),
                  ),
                ),
              ],
            );
          } else if (state is GetFeedState &&
              state.uiState.isSuccessful == true &&
              state.feedItems.isNotEmpty == true) {
            final items = state.feedItems;
            final length = items.length;

            return RefreshIndicatorScrollableWrapper(
              onRefresh: () async {
                final bloc = context.read<FeedBloc>();
                bloc.add(FeedItemsRequested());
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  return notification.onPaginatedScroll(
                    isLoadingData: _isLoadingPaginatedData,
                    metaData: PaginationData(
                      lastId: items[items.length - 1].id,
                      isLastPage: state.isLastPage,
                    ),
                    onPaginated: _onLoadMoreRequested,
                  );
                },
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return WriteForFeedWidget();
                    } else if (index == length + 1) {
                      if (state.isLastPage != true) {
                        return const Padding(
                          padding: EdgeInsets.only(
                            bottom: 32.0,
                            top: 16.0,
                          ),
                          child: Column(
                            children: [
                              BaseDataLoader(),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: const SizedBox.shrink(),
                        );
                      }
                    } else {
                      final adjustedIndex = index - 1;
                      return FeedItemWidget(item: items[adjustedIndex]);
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24.0);
                  },
                  itemCount: length + 2,
                ),
              ),
            );
          } else {
            return RefreshIndicatorNonScrollableWrapper(
              onRefresh: () async {
                final bloc = context.read<FeedBloc>();
                bloc.add(FeedItemsRequested());
              },
              child: Column(
                spacing: 24.0,
                children: [
                  WriteForFeedWidget(),
                  Expanded(
                    child: const SizedBox.expand(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _onLoadMoreRequested(
    BuildContext context,
    int nextPageData,
  ) {
    _isLoadingPaginatedData = true;

    final bloc = context.read<FeedBloc>();
    bloc.add(
      FeedItemsRequested(
        lastFeedId: nextPageData,
        shouldShowLoading: false,
      ),
    );
  }
}
