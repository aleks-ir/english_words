import 'package:hive/hive.dart';
import 'package:word_study_puzzle/domain/models/history.dart';

part 'history_dto.g.dart';

@HiveType(typeId: 2)
class HistoryDto {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final int wordExploredCount;
  @HiveField(2)
  final int wordRepeatingCount;
  @HiveField(3)
  final int wordToExploreCount;
  @HiveField(4)
  final bool awardWasReceived;

  HistoryDto(
      {required this.date,
      this.wordExploredCount = 0,
      this.wordRepeatingCount = 0,
      this.wordToExploreCount = 10,
      this.awardWasReceived = false});

  factory HistoryDto.fromDomain(History history) {
    return HistoryDto(
      date: history.date,
      wordExploredCount: history.wordExploringCount,
      wordRepeatingCount: history.wordRepeatingCount,
      wordToExploreCount: history.wordToExploreCount,
      awardWasReceived: history.awardWasReceived,
    );
  }

  History toDomain() {
    return History(
      date: date,
      wordExploringCount: wordExploredCount,
      wordRepeatingCount: wordRepeatingCount,
      wordToExploreCount: wordToExploreCount,
      awardWasReceived: awardWasReceived,
    );
  }

  HistoryDto copyWith({
    String? date,
    int? wordExploredCount,
    int? wordRepeatingCount,
    int? wordToExploreCount,
    bool? awardWasReceived,
  }) {
    return HistoryDto(
      date: date ?? this.date,
      wordExploredCount: wordExploredCount ?? this.wordExploredCount,
      wordRepeatingCount: wordRepeatingCount ?? this.wordRepeatingCount,
      wordToExploreCount: wordToExploreCount ?? this.wordToExploreCount,
      awardWasReceived: awardWasReceived ?? this.awardWasReceived,
    );
  }

  @override
  String toString() {
    return 'HistoryDto{data: $date, wordExploredCount: $wordExploredCount, wordExploringCount: $wordToExploreCount, awardWasReceived: $awardWasReceived}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryDto &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          wordExploredCount == other.wordExploredCount &&
          wordToExploreCount == other.wordToExploreCount &&
          awardWasReceived == other.awardWasReceived;

  @override
  int get hashCode =>
      date.hashCode ^
      wordExploredCount.hashCode ^
      wordToExploreCount.hashCode ^
      awardWasReceived.hashCode;
}
