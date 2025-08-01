import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Lecture persistence service following Single Responsibility Principle
/// Responsibility: Handle saving and loading lecture progress and activity states
class LecturePersistenceService {
  static const String _currentSlideKey = 'lecture_current_slide';
  static const String _completedSlidesKey = 'lecture_completed_slides';
  static const String _lastAccessedKey = 'lecture_last_accessed';
  static const String _slideStatesKey = 'lecture_slide_states';

  /// Save current slide index
  static Future<void> saveCurrentSlide(int slideIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_currentSlideKey, slideIndex);
    await prefs.setString(_lastAccessedKey, DateTime.now().toIso8601String());
  }

  /// Load current slide index
  static Future<int> loadCurrentSlide() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_currentSlideKey) ?? 0;
  }

  /// Mark slide as completed
  static Future<void> markSlideCompleted(int slideIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final completedSlides = prefs.getStringList(_completedSlidesKey) ?? [];
    final slideIndexStr = slideIndex.toString();
    
    if (!completedSlides.contains(slideIndexStr)) {
      completedSlides.add(slideIndexStr);
      await prefs.setStringList(_completedSlidesKey, completedSlides);
    }
  }

  /// Check if slide is completed
  static Future<bool> isSlideCompleted(int slideIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final completedSlides = prefs.getStringList(_completedSlidesKey) ?? [];
    return completedSlides.contains(slideIndex.toString());
  }

  /// Get all completed slides
  static Future<List<int>> getCompletedSlides() async {
    final prefs = await SharedPreferences.getInstance();
    final completedSlides = prefs.getStringList(_completedSlidesKey) ?? [];
    return completedSlides.map((e) => int.tryParse(e) ?? 0).toList();
  }

  /// Get last accessed time
  static Future<DateTime?> getLastAccessedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final lastAccessedStr = prefs.getString(_lastAccessedKey);
    if (lastAccessedStr != null) {
      return DateTime.tryParse(lastAccessedStr);
    }
    return null;
  }

  /// Save slide state (for activities like multiple choice, open-ended, etc.)
  static Future<void> saveSlideState(int slideIndex, Map<String, dynamic> state) async {
    final prefs = await SharedPreferences.getInstance();
    final allStates = await _loadAllSlideStates();
    allStates[slideIndex.toString()] = state;
    await prefs.setString(_slideStatesKey, jsonEncode(allStates));
  }

  /// Load slide state
  static Future<Map<String, dynamic>?> loadSlideState(int slideIndex) async {
    final allStates = await _loadAllSlideStates();
    return allStates[slideIndex.toString()];
  }

  /// Load all slide states
  static Future<Map<String, Map<String, dynamic>>> _loadAllSlideStates() async {
    final prefs = await SharedPreferences.getInstance();
    final statesJson = prefs.getString(_slideStatesKey);
    if (statesJson != null) {
      try {
        final decoded = jsonDecode(statesJson) as Map<String, dynamic>;
        return decoded.map((key, value) => 
          MapEntry(key, Map<String, dynamic>.from(value as Map))
        );
      } catch (e) {
        // If JSON is corrupted, return empty map
        return {};
      }
    }
    return {};
  }

  /// Reset lecture progress
  static Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentSlideKey);
    await prefs.remove(_completedSlidesKey);
    await prefs.remove(_lastAccessedKey);
    await prefs.remove(_slideStatesKey);
  }

  /// Get progress percentage
  static Future<double> getProgressPercentage(int totalSlides) async {
    final completedSlides = await getCompletedSlides();
    if (totalSlides == 0) return 0.0;
    return completedSlides.length / totalSlides;
  }
}