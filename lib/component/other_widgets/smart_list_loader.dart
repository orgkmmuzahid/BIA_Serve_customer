import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class SmartListLoader extends StatefulWidget {
  const SmartListLoader({
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.isLoading = false,
    this.isLoadDone = false,
    this.padding,
    super.key,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function()? onRefresh;
  final Function()? onLoadMore;
  final bool isLoading;
  final bool isLoadDone;
  final EdgeInsetsGeometry? padding;

  @override
  State<SmartListLoader> createState() => _SmartListLoaderState();
}

class _SmartListLoaderState extends State<SmartListLoader> {
  late final ScrollController _scrollController;
  final Debouncer _debouncer = Debouncer(delay: const Duration(milliseconds: 300));

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_debouncer.isRunning) return;
    _debouncer.call(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 150 &&
          widget.onLoadMore != null &&
          !widget.isLoading &&
          !widget.isLoadDone) {
        widget.onLoadMore!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      padding: widget.padding,
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        if (index < widget.itemCount) {
          return widget.itemBuilder(context, index);
        } else if (widget.isLoading) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 80, top: 16),
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
    );

    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async {
          widget.onRefresh!();
        },
        child: list,
      );
    }

    return list;
  }
}
