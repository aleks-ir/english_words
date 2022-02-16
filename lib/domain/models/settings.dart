class Settings {
  final bool hasLocalData;
  final String theme;
  final bool isVibration;
  final bool isNotification;
  final String timeNotification;
  final int wordCount;
  final int starCount;
  final String selectedCategory;

  Settings(
      {required this.hasLocalData,
      required this.theme,
      required this.isVibration,
      required this.isNotification,
      required this.timeNotification,
      required this.wordCount,
      required this.starCount,
      required this.selectedCategory});

  @override
  String toString() {
    return 'Settings{hasLocalData: $hasLocalData, theme: $theme, isVibration: $isVibration, isNotification: $isNotification, timeNotification: $timeNotification, wordCount: $wordCount, starCount: $starCount, selectedCategory: $selectedCategory}';
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
          wordCount == other.wordCount &&
          starCount == other.starCount &&
          selectedCategory == other.selectedCategory;

  @override
  int get hashCode =>
      hasLocalData.hashCode ^
      theme.hashCode ^
      isVibration.hashCode ^
      isNotification.hashCode ^
      timeNotification.hashCode ^
      wordCount.hashCode ^
      starCount.hashCode ^
      selectedCategory.hashCode;
}
