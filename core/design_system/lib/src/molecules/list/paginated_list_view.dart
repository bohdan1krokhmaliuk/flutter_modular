import 'package:flutter/widgets.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    this.physics,
    required this.hasNextPage,
    required this.isLoadingNextPage,
    required this.failedToLoadNextPage,
    required this.onLoadNextPage,
    this.error,
    this.loader,
    this.separatorBuilder,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;

  final bool hasNextPage;
  final bool isLoadingNextPage;
  final bool failedToLoadNextPage;
  final VoidCallback onLoadNextPage;

  final Widget? error;
  final Widget? loader;
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_pageScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: widget.padding,
    physics: widget.physics,
    itemCount: _getItemsCount,
    controller: _scrollController,
    separatorBuilder:
        widget.separatorBuilder ?? (_, _) => const SizedBox.shrink(),
    itemBuilder: (context, i) {
      if (i == widget.itemCount) {
        if (widget.isLoadingNextPage && widget.loader != null) {
          return widget.loader;
        } else if (widget.failedToLoadNextPage && widget.error != null) {
          return widget.error;
        } else {
          return null;
        }
      }

      return widget.itemBuilder(context, i);
    },
  );

  int get _getItemsCount {
    final hasAdditionalItem =
        (widget.isLoadingNextPage && widget.loader != null) ||
        (widget.failedToLoadNextPage && widget.error != null);
    return widget.itemCount + (hasAdditionalItem ? 1 : 0);
  }

  void _pageScrollListener() {
    if (widget.hasNextPage &&
        !widget.isLoadingNextPage &&
        !widget.failedToLoadNextPage &&
        _scrollController.position.extentAfter < 300) {
      widget.onLoadNextPage();
    }
  }
}
