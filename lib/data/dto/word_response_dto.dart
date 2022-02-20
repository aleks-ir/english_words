class WordResponseDto {
  final String word;
  final String pronunciation;
  final List<DefinitionAndExample> definitionAndExample;

  WordResponseDto({
    required this.word,
    required this.pronunciation,
    required this.definitionAndExample,
  });

  factory WordResponseDto.fromJson(Map<String, dynamic> json) {
    return WordResponseDto(
      word: json['word'],
      pronunciation: json['pronunciation'] ?? '',
      definitionAndExample:
          DefinitionAndExample.fromJsonArray(json['definitions']),
    );
  }

  @override
  String toString() {
    return 'WordResponseDto{word: $word, pronunciation: $pronunciation, definitionAndExample: $definitionAndExample}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordResponseDto &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          pronunciation == other.pronunciation &&
          definitionAndExample == other.definitionAndExample;

  @override
  int get hashCode =>
      word.hashCode ^ pronunciation.hashCode ^ definitionAndExample.hashCode;
}

class DefinitionAndExample {
  final String definition;
  final String example;


  DefinitionAndExample({
    required this.definition,
    required this.example,
  });

  factory DefinitionAndExample.fromJson(Map<String, dynamic> json) {
    return DefinitionAndExample(
      definition: json['definition'] ?? '',
      example: json['example'] ?? '',
    );
  }

  static List<DefinitionAndExample> fromJsonArray(List<dynamic> jsonArray) {
    List<DefinitionAndExample> definitionsFromJson = [];

    for (var jsonData in jsonArray) {
      definitionsFromJson.add(DefinitionAndExample.fromJson(jsonData));
    }

    return definitionsFromJson;
  }

  @override
  String toString() {
    return 'DefinitionAndExample{definition: $definition, example: $example}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinitionAndExample &&
          runtimeType == other.runtimeType &&
          definition == other.definition &&
          example == other.example;

  @override
  int get hashCode => definition.hashCode ^ example.hashCode;
}
