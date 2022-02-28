import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';

part 'history_dto.g.dart';

@HiveType(typeId: 2)
class HistoryDto {
  @HiveField(0)
  final String data;
  @HiveField(1)
  final int wordExploredCount;
  @HiveField(2)
  final bool wasAllWordsExplored;

  HistoryDto(
      {required this.data,
        this.wordExploredCount = 10,
      this.wasAllWordsExplored = false,});

  factory HistoryDto.fromDomain(History history) {
    return HistoryDto(
      data: history.data,
      wordExploredCount: history.wordCount,
      wasAllWordsExplored: history.wasWordsExplored,
    );
  }

  History toDomain() {
    return History(
      data: data,
      wordCount: wordExploredCount,
      wasWordsExplored: wasAllWordsExplored,
    );
  }

  HistoryDto copyWith({
    String? data,
    int? wordExploredCount,
    bool? wasAllWordsExplored,
  }) {
    return HistoryDto(
      data: data ?? this.data,
      wordExploredCount: wordExploredCount ?? this.wordExploredCount,
      wasAllWordsExplored: wasAllWordsExplored ?? this.wasAllWordsExplored,
    );
  }

  @override
  String toString() {
    return 'HistoryDto{data: $data, wordCount: $wordExploredCount, wasWordsExplored: $wasAllWordsExplored}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryDto &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          wordExploredCount == other.wordExploredCount &&
          wasAllWordsExplored == other.wasAllWordsExplored;

  @override
  int get hashCode =>
      data.hashCode ^ wordExploredCount.hashCode ^ wasAllWordsExplored.hashCode;
}
