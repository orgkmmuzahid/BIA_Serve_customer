import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryService {
  String _getPreferenceKey(String key) => 'search_history_$key';

  Future<List<String>> getSuggestions(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_getPreferenceKey(key)) ?? [];
  }

  Future<void> addSearchTerm(String key, String term) async {
    final prefs = await SharedPreferences.getInstance();
    final prefKey = _getPreferenceKey(key);
    final List<String> terms = prefs.getStringList(prefKey) ?? [];
    terms.remove(term);
    terms.insert(0, term);
    const int maxHistoryLength = 10;
    if (terms.length > maxHistoryLength) {
      terms.removeRange(maxHistoryLength, terms.length);
    }
    await prefs.setStringList(prefKey, terms);
  }

  Future<void> clearSuggestions(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getPreferenceKey(key));
  }
}
