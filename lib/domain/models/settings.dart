class Settings {
  bool hasLocalData;
  String theme;
  bool isVibration;
  bool isNotification;
  String timeNotification;
  int wordToExploreCount;
  int puzzleCount;
  String selectedCategory;

  Settings(
      {required this.hasLocalData,
      required this.theme,
      required this.isVibration,
      required this.isNotification,
      required this.timeNotification,
      required this.wordToExploreCount,
      required this.puzzleCount,
      required this.selectedCategory});

  @override
  String toString() {
    return 'Settings{hasLocalData: $hasLocalData, theme: $theme, isVibration: $isVibration, isNotification: $isNotification, timeNotification: $timeNotification, wordCount: $wordToExploreCount, starCount: $puzzleCount, selectedCategory: $selectedCategory}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings &&
          runtimeType == other.runtimeType &&
          hasLocalData == other.hasLocalData &&
          theme == other.theme &&
          isVibration == other.isVibration &&
          isNotification == other.isNotification &&
          timeNotification == other.timeNotification &&
          wordToExploreCount == other.wordToExploreCount &&
          puzzleCount == other.puzzleCount &&
          selectedCategory == other.selectedCategory;

  @override
  int get hashCode =>
      hasLocalData.hashCode ^
      theme.hashCode ^
      isVibration.hashCode ^
      isNotification.hashCode ^
      timeNotification.hashCode ^
      wordToExploreCount.hashCode ^
      puzzleCount.hashCode ^
      selectedCategory.hashCode;
}
