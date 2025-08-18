import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  const SearchState({this.suggestions = const [], this.isLoading = false});
  final List<String> suggestions;
  final bool isLoading;

  SearchState copyWith({List<String>? suggestions, bool? isLoading}) {
    return SearchState(suggestions: suggestions ?? this.suggestions, isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [suggestions, isLoading];
}
