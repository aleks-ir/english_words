import 'package:hive/hive.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';

part 'settings_dto.g.dart';

@HiveType(typeId: 1)
class SettingsDto {
  @HiveField(0)
  final bool hasLocalData;
  @HiveField(1)
  final bool darkThemeIsEnabled;
  @HiveField(2)
  final bool viewCarouselIsEnabled;
  @HiveField(3)
  final bool isVibration;
  @HiveField(4)
  final bool isNotification;
  @HiveField(5)
  final String timeNotification;
  @HiveField(6)
  final int wordToExploreCount;
  @HiveField(7)
  final int day;
  @HiveField(8)
  final String selectedCategory;

  SettingsDto(
      {required this.hasLocalData,
      required this.darkThemeIsEnabled,
      required this.viewCarouselIsEnabled,
      required this.isVibration,
      required this.isNotification,
      required this.timeNotification,
      required this.wordToExploreCount,
      required this.day,
      required this.selectedCategory});

  factory SettingsDto.fromDomain(Settings settings) {
    return SettingsDto(
        hasLocalData: settings.hasLocalData,
        darkThemeIsEnabled: settings.darkThemeIsEnabled,
        viewCarouselIsEnabled: settings.viewCarouselIsEnabled,
        isVibration: settings.isVibration,
        isNotification: settings.isNotification,
        timeNotification: settings.timeNotification,
        wordToExploreCount: settings.wordToExploreCount,
        day: settings.day,
        selectedCategory: settings.selectedCategory);
  }

  Settings toDomain() {
    return Settings(
        hasLocalData: hasLocalData,
        darkThemeIsEnabled: darkThemeIsEnabled,
        viewCarouselIsEnabled: viewCarouselIsEnabled,
        isVibration: isVibration,
        isNotification: isNotification,
        timeNotification: timeNotification,
        wordToExploreCount: wordToExploreCount,
        day: day,
        selectedCategory: selectedCategory);
  }

  SettingsDto copyWith(
      {bool? hasLocalData,
      bool? darkThemeIsEnabled,
      bool? viewCarouselIsEnabled,
      bool? isVibration,
      bool? isNotification,
      String? timeNotification,
      int? wordToExploreCount,
      int? day,
      String? selectedCategory}) {
    return SettingsDto(
        hasLocalData: hasLocalData ?? this.hasLocalData,
        darkThemeIsEnabled: darkThemeIsEnabled ?? this.darkThemeIsEnabled,
        viewCarouselIsEnabled: viewCarouselIsEnabled ?? this.viewCarouselIsEnabled,
        isVibration: isVibration ?? this.isVibration,
        isNotification: isNotification ?? this.isNotification,
        timeNotification: timeNotification ?? this.timeNotification,
        wordToExploreCount: wordToExploreCount ?? this.wordToExploreCount,
        day: day ?? this.day,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }

  @override
  String toString() {
    return 'SettingsDto{hasLocalData: $hasLocalData, theme: $darkThemeIsEnabled, isVibration: $isVibration, isNotification: $isNotification, timeNotification: $timeNotification, wordCount: $wordToExploreCount, starCount: $day, selectedCategory: $selectedCategory}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDto &&
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
