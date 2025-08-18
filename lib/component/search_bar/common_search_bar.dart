import 'package:bai_serve_customer/component/search_bar/search_cubit.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import 'search_state.dart';

class CommonSearchBar extends StatefulWidget {
  const CommonSearchBar({required this.hints, required this.onSubmit, super.key});

  final String hints;
  final Function(String) onSubmit;

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  late SearchController controller;
  bool isListenerAdded = false;

  @override
  void initState() {
    controller = SearchController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(widget.hints), //hints as unique id here
      child: LayoutBuilder(
        builder: (c, contstrain) {
          final cubit = c.read<SearchCubit>();
          return SearchAnchor(
            searchController: controller,
            viewLeading: const Icon(Icons.search),
            viewShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8.w)),
            viewBackgroundColor: Colors.white,

            isFullScreen: false,
            viewOnChanged: (value) {
              cubit.filterSuggestions(term: value);
            },

            viewOnSubmitted: (value) {
              _performSearch(context, controller, cubit);
            },
            builder:
                (_, c) => SearchBar(
                  controller: controller,
                  hintText: widget.hints,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    c.openView();
                  },
                  leading: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _performSearch(context, controller, cubit);
                    },
                  ),
                ),
            suggestionsBuilder: (_, c) {
              return [
                StreamBuilder<SearchState>(
                  stream: cubit.stream,
                  initialData: cubit.state,
                  builder: (context, snapshot) {
                    final state = snapshot.data!;

                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final filteredSuggestions = state.suggestions;

                    if (filteredSuggestions.isEmpty) {
                      return const Padding(padding: EdgeInsets.all(16.0), child: Text('No search history.'));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.suggestions.isNotEmpty)
                          ..._buildSuggestions(
                            context: context,
                            suggestions: state.suggestions,
                            onClear: cubit.clearHistory,
                            onSubmit: widget.onSubmit,
                          ),
                      ],
                    );
                  },
                ),
              ];
            },
          );
        },
      ),
    );
  }

  void _performSearch(BuildContext context, SearchController controller, SearchCubit cubit) {
    final newValue = controller.text.trim();
    if (newValue.isEmpty) return;
    FocusScope.of(context).unfocus();
    cubit.addSearchTerm(term: newValue);
    controller.text = '';
    controller.closeView(newValue);

    widget.onSubmit(newValue);
  }

  List<Widget> _buildSuggestions({
    required BuildContext context,
    required List<String> suggestions,
    required VoidCallback onClear,
    required Function(String) onSubmit,
  }) {
    return [
      if (suggestions.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: onClear, child: const Text('Clear All')),
          ),
        ),
      ...List.generate(suggestions.length, (index) {
        final item = suggestions[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            controller.text = item;
            controller.closeView(item);

            widget.onSubmit(item);
          },
        );
      }),
    ];
  }
}
