class WordResponseDto {
  final String word;
  final String pronunciation;
  final List<DefinitionsAndExamples> definitionsAndExamples;

  WordResponseDto({
    required this.word,
    required this.pronunciation,
    required this.definitionsAndExamples,
  });

  factory WordResponseDto.fromJson(Map<String, dynamic> json) {
    return WordResponseDto(
      word: json['word'],
      pronunciation: json['pronunciation'] ?? '',
      definitionsAndExamples:
          DefinitionsAndExamples.fromJsonArray(json['definitions']),
    );
  }
}

class DefinitionsAndExamples {
  final String definition;
  final String example;

  DefinitionsAndExamples({
    required this.definition,
    required this.example,
  });

  factory DefinitionsAndExamples.fromJson(Map<String, dynamic> json) {
    return DefinitionsAndExamples(
      definition: json['definition'] ?? '',
      example: json['example'] ?? '',
    );
  }

  static List<DefinitionsAndExamples> fromJsonArray(List<dynamic> jsonArray) {
    List<DefinitionsAndExamples> definitionsFromJson = [];

    for (var jsonData in jsonArray) {
      definitionsFromJson.add(DefinitionsAndExamples.fromJson(jsonData));
    }

    return definitionsFromJson;
  }
}
