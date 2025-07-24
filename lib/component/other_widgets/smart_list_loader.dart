import 'package:flutter/material.dart';

class SmartListLoader extends StatelessWidget {
  const SmartListLoader({
    required this.scrollController, required this.itemCount, required this.itemBuilder, super.key,
    this.onRefresh,
    this.onLoadMore,
    this.isLoading = false,
    this.isLoadDone = false,
    this.padding,
  });

  final ScrollController scrollController;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final bool isLoading;
  final bool isLoadDone;
  final EdgeInsetsGeometry? padding;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 100 &&
        onLoadMore != null &&
        !isLoading &&
        !isLoadDone) {
      onLoadMore!();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
final list = NotificationListener<ScrollNotification>(
  onNotification: _handleScrollNotification,
  child: ListView.builder(
    controller: scrollController,
    physics: const AlwaysScrollableScrollPhysics(), // Add this
    padding: padding,
    itemCount: itemCount + 1,
    itemBuilder: (context, index) {
      if (index < itemCount) {
        return itemBuilder(context, index);
      } else if (isLoading) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (isLoadDone) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: Text('All data loaded')),
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  ),
);


    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        child: list,
      );
    }

    return list;
  }
}
