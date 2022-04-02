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
  final int wordToExploreCount;
  @HiveField(3)
  final bool awardWasReceived;

  HistoryDto(
      {required this.date,
        this.wordExploredCount = 0,
      this.wordToExploreCount = 10,
      this.awardWasReceived = false});

  factory HistoryDto.fromDomain(History history) {
    return HistoryDto(
      date: history.date,
      wordExploredCount: history.wordExploredCount,
      wordToExploreCount: history.wordToExploreCount,
      awardWasReceived: history.awardWasReceived,
    );
  }

  History toDomain() {
    return History(
      date: date,
      wordExploredCount: wordExploredCount,
      wordToExploreCount: wordToExploreCount,
      awardWasReceived: awardWasReceived,
    );
  }

  HistoryDto copyWith({
    String? data,
    int? wordExploredCount,
    int? wordExploringCount,
    bool? awardWasReceived,
  }) {
    return HistoryDto(
      date: data ?? this.date,
      wordExploredCount: wordExploredCount ?? this.wordExploredCount,
      wordToExploreCount: wordExploringCount ?? this.wordToExploreCount,
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
