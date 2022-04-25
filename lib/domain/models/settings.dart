class Settings {
  bool hasLocalData;
  bool darkThemeIsEnabled;
  bool isVibration;
  bool isNotification;
  String timeNotification;
  int wordToExploreCount;
  int day;
  String selectedCategory;

  Settings(
      {required this.hasLocalData,
      required this.darkThemeIsEnabled,
      required this.isVibration,
      required this.isNotification,
      required this.timeNotification,
      required this.wordToExploreCount,
      required this.day,
      required this.selectedCategory});

  @override
  String toString() {
    return 'Settings{hasLocalData: $hasLocalData, theme: $darkThemeIsEnabled, isVibration: $isVibration, isNotification: $isNotification, timeNotification: $timeNotification, wordCount: $wordToExploreCount, starCount: $day, selectedCategory: $selectedCategory}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings &&
          runtimeType == other.runtimeType &&
          hasLocalData == other.hasLocalData &&
          darkThemeIsEnabled == other.darkThemeIsEnabled &&
          isVibration == other.isVibration &&
          isNotification == other.isNotification &&
          timeNotification == other.timeNotification &&
          wordToExploreCount == other.wordToExploreCount &&
          day == other.day &&
          selectedCategory == other.selectedCategory;

  @override
  int get hashCode =>
      hasLocalData.hashCode ^
      darkThemeIsEnabled.hashCode ^
      isVibration.hashCode ^
      isNotification.hashCode ^
      timeNotification.hashCode ^
      wordToExploreCount.hashCode ^
      day.hashCode ^
      selectedCategory.hashCode;
}
