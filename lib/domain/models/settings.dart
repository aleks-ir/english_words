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
}
