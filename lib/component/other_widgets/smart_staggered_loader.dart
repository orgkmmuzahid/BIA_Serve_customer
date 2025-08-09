import 'package:flutter/material.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class SmartStaggeredLoader extends StatefulWidget {
  const SmartStaggeredLoader({
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.isLoading = false,
    this.isLoadingMore = false, // new flag for pagination loading
    this.isLoadDone = false,
    this.padding,
    this.maxCrossAxisExtent = 200,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.physics,
    this.staggeredTile,
    super.key,
    this.topWidget
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function()? onRefresh;
  final Function()? onLoadMore;
  final bool isLoading; // initial load / refresh loading
  final bool isLoadingMore; // pagination load more loading
  final bool isLoadDone; // all data loaded flag
  final EdgeInsetsGeometry? padding;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final ScrollPhysics? physics;
  final StaggeredTile? staggeredTile;
  final Widget? topWidget;

  @override
  State<SmartStaggeredLoader> createState() => _SmartStaggeredLoaderState();
}

class _SmartStaggeredLoaderState extends State<SmartStaggeredLoader> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        widget.onLoadMore != null &&
        !widget.isLoading &&
        !widget.isLoadingMore &&
        !widget.isLoadDone &&
        widget.itemCount > 0) {
      widget.onLoadMore!();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildGrid({ScrollController? controller, ScrollPhysics? physics}) {
    return StaggeredGridView.extentBuilder(
      key: ValueKey('staggered${widget.itemCount}'),
      controller: controller,
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      padding: widget.padding,
      shrinkWrap: physics is NeverScrollableScrollPhysics,
      maxCrossAxisExtent: widget.maxCrossAxisExtent,
      itemCount: widget.itemCount + 1, // +1 for loading or end indicator
      itemBuilder: (context, index) {
        if (index < widget.itemCount) {
          return widget.itemBuilder(context, index);
        } else if (widget.isLoadingMore) {
          // Show load more indicator at the bottom of list
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (widget.isLoadDone) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: Text('All data loaded')),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
      staggeredTileBuilder: (index) => widget.staggeredTile ?? const StaggeredTile.fit(2),
      mainAxisSpacing: widget.mainAxisSpacing,
      crossAxisSpacing: widget.crossAxisSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show placeholder if no data with loading or empty text
    if (widget.itemCount == 0) {
      final placeholder = ListView(
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        padding: widget.padding ?? const EdgeInsets.all(16),
        children: [
          if (widget.isLoading) // only initial loading shows full screen indicator
            const Center(child: CircularProgressIndicator())
          else if (widget.isLoadDone)
            const Center(child: Text('No data found'))
          else
            const SizedBox(height: 300), // to enable pull-to-refresh overscroll
        ],
      );

      return widget.onRefresh != null
          ? RefreshIndicator(
            onRefresh: () async {
              await widget.onRefresh?.call();
            },
            child: placeholder,
          )
          : placeholder;
    }

    // Show staggered grid with optional pull-to-refresh
    final grid =
        widget.topWidget == null
            ? _buildGrid(physics: const AlwaysScrollableScrollPhysics(), controller: _scrollController)
            : SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [widget.topWidget!, _buildGrid(physics: const NeverScrollableScrollPhysics())]),
            );

    return widget.onRefresh != null
        ? RefreshIndicator(
          onRefresh: () async {
            await widget.onRefresh?.call();
          },
          child: grid,
        )
        : grid;
  }
}
