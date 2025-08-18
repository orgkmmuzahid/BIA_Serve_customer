import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';

import 'search_history_service.dart';
import 'search_state.dart';

class SearchCubit extends SafeCubit<SearchState> {
  SearchCubit(this.uniqueId) : super(const SearchState()) {
    _loadAllSuggestions();
  }
  final String uniqueId;
  final SearchHistoryService _searchHistoryService = getIt();

  List<String> _allHistorySuggestions = [];

  Future<void> _loadAllSuggestions() async {
    emit(state.copyWith(isLoading: true));
    _allHistorySuggestions = await _searchHistoryService.getSuggestions(uniqueId);
    emit(state.copyWith(suggestions: _allHistorySuggestions, isLoading: false));
  }

  Future<void> filterSuggestions({required String term}) async {
    final trimmedTerm = term.trim().toLowerCase();
    if (trimmedTerm.isEmpty) {
      emit(state.copyWith(suggestions: _allHistorySuggestions));
    } else {
      final filteredList =
          _allHistorySuggestions.where((suggestion) => suggestion.toLowerCase().startsWith(trimmedTerm)).toList();
      emit(state.copyWith(suggestions: filteredList));
    }
  }

  Future<void> addSearchTerm({required String term}) async {
    final trimmedTerm = term.trim();
    if (trimmedTerm.isNotEmpty) {
      await _searchHistoryService.addSearchTerm(uniqueId, trimmedTerm);
      await _loadAllSuggestions();
    }
  }

  Future<void> clearHistory() async {
    await _searchHistoryService.clearSuggestions(uniqueId);
    _allHistorySuggestions = [];
    emit(const SearchState());
  }
}
