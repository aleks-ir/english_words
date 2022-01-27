
import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

part 'word_dto.g.dart';

@HiveType(typeId: 1)
class WordDto {
  WordDto({

    required this.title,
  });

  factory WordDto.fromDomain(Word word) {
    return WordDto(

      title: word.title,
    );
  }

  Word toDomain() {
    return Word(

      title: title,
    );
  }

  bool get validWord => title.isNotEmpty == true;

  WordDto copyWith({

    String? title,
  }) {
    return WordDto(

      title: title ?? this.title,
    );
  }


  @HiveField(0)
  final String title;

}
