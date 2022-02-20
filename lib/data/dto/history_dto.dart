import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';

part 'history_dto.g.dart';

@HiveType(typeId: 2)
class HistoryDto {
  @HiveField(0)
  final String data;
  @HiveField(1)
  final int wordCount;
  @HiveField(2)
  final bool wasWordsExplored;

  HistoryDto(
      {required this.data,
      required this.wordCount,
      required this.wasWordsExplored,});

  factory HistoryDto.fromDomain(History history) {
    return HistoryDto(
      data: history.data,
      wordCount: history.wordCount,
      wasWordsExplored: history.wasWordsExplored,
    );
  }

  History toDomain() {
    return History(
      data: data,
      wordCount: wordCount,
      wasWordsExplored: wasWordsExplored,
    );
  }

  HistoryDto copyWith({
    String? data,
    int? wordCount,
    bool? wasWordsExplored,
  }) {
    return HistoryDto(
      data: data ?? this.data,
      wordCount: wordCount ?? this.wordCount,
      wasWordsExplored: wasWordsExplored ?? this.wasWordsExplored,
    );
  }

  @override
  String toString() {
    return 'HistoryDto{data: $data, wordCount: $wordCount, wasWordsExplored: $wasWordsExplored}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryDto &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          wordCount == other.wordCount &&
          wasWordsExplored == other.wasWordsExplored;

  @override
  int get hashCode =>
      data.hashCode ^ wordCount.hashCode ^ wasWordsExplored.hashCode;
}
