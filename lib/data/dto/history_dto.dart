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
  final int wordExploredCount;
  @HiveField(2)
  final bool areWordsExplored;

  const HistoryDto(
      {required this.data,
      required this.wordExploredCount,
      required this.areWordsExplored,});

  factory HistoryDto.fromDomain(History history) {
    return HistoryDto(
      data: history.data,
      wordExploredCount: history.wordExploredCount,
      areWordsExplored: history.areWordsExplored,
    );
  }

  History toDomain() {
    return History(
      data: data,
      wordExploredCount: wordExploredCount,
      areWordsExplored: areWordsExplored,
    );
  }

  HistoryDto copyWith({
    String? data,
    int? wordExploredCount,
    bool? areWordsExplored,
  }) {
    return HistoryDto(
      data: data ?? this.data,
      wordExploredCount: wordExploredCount ?? this.wordExploredCount,
      areWordsExplored: areWordsExplored ?? this.areWordsExplored,
    );
  }
}
