import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';
import 'package:words_3000_puzzle/domain/models/settings.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

part 'history_dto.g.dart';

@HiveType(typeId: 2)
class HistoryDto {
  @HiveField(0)
  final String data;
  @HiveField(1)
  final int wordStudiedCount;
  @HiveField(2)
  final bool isGoalReached;

  const HistoryDto(
      {required this.data,
      required this.wordStudiedCount,
      required this.isGoalReached,});

  factory HistoryDto.fromDomain(History progressHistory) {
    return HistoryDto(
      data: progressHistory.data,
      wordStudiedCount: progressHistory.wordStudiedCount,
      isGoalReached: progressHistory.isGoalReached,
    );
  }

  History toDomain() {
    return History(
      data: data,
      wordStudiedCount: wordStudiedCount,
      isGoalReached: isGoalReached,
    );
  }

  HistoryDto copyWith({
    String? data,
    int? wordStudiedCount,
    bool? isGoalReached,
  }) {
    return HistoryDto(
      data: data ?? this.data,
      wordStudiedCount: wordStudiedCount ?? this.wordStudiedCount,
      isGoalReached: isGoalReached ?? this.isGoalReached,
    );
  }
}
