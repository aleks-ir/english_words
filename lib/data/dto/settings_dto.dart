import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/common/constants/box_keys.dart';
import 'package:words_3000_puzzle/domain/models/settings.dart';

part 'settings_dto.g.dart';

@HiveType(typeId: 1)
class SettingsDto {
  @HiveField(0, defaultValue: false)
  final bool hasLocalData;
  @HiveField(1, defaultValue: 'light')
  final String theme;
  @HiveField(2, defaultValue: true)
  final bool isVibration;
  @HiveField(3, defaultValue: false)
  final bool isNotification;
  @HiveField(4, defaultValue: '12:00')
  final String timeNotification;
  @HiveField(5, defaultValue: 10)
  final int wordCount;
  @HiveField(6, defaultValue: 0)
  final int starCount;
  @HiveField(7, defaultValue: BoxKeys.settings)
  final String selectedCategory;

  const SettingsDto(
      {required this.hasLocalData,
      required this.theme,
      required this.isVibration,
      required this.isNotification,
      required this.timeNotification,
      required this.wordCount,
      required this.starCount,
      required this.selectedCategory});

  factory SettingsDto.fromDomain(Settings settings) {
    return SettingsDto(
        hasLocalData: settings.hasLocalData,
        theme: settings.theme,
        isVibration: settings.isVibration,
        isNotification: settings.isNotification,
        timeNotification: settings.timeNotification,
        wordCount: settings.wordCount,
        starCount: settings.starCount,
        selectedCategory: settings.selectedCategory);
  }

  Settings toDomain() {
    return Settings(
        hasLocalData: hasLocalData,
        theme: theme,
        isVibration: isVibration,
        isNotification: isNotification,
        timeNotification: timeNotification,
        wordCount: wordCount,
        starCount: starCount,
        selectedCategory: selectedCategory);
  }

  SettingsDto copyWith(
      {bool? hasLocalData,
      String? theme,
      bool? isVibration,
      bool? isNotification,
      String? timeNotification,
      int? wordCount,
      int? starCount,
      String? selectedCategory}) {
    return SettingsDto(
        hasLocalData: hasLocalData ?? this.hasLocalData,
        theme: theme ?? this.theme,
        isVibration: isVibration ?? this.isVibration,
        isNotification: isNotification ?? this.isNotification,
        timeNotification: timeNotification ?? this.timeNotification,
        wordCount: wordCount ?? this.wordCount,
        starCount: starCount ?? this.starCount,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }
}
