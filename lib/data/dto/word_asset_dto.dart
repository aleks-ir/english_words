import 'dart:convert';

class WordAssetDto {
  String word;
  List<String> definitions;
  List<String> examples;
  List<String> images;

  WordAssetDto(
      {required this.word,
      required this.definitions,
      required this.examples,
      required this.images});

  factory WordAssetDto.fromJson(Map<String, dynamic> json) => WordAssetDto(
        word: json["word"],
        definitions: fromJsonArray(json["definitions"]),
        examples: fromJsonArray(json["examples"]),
        images: fromJsonArray(json["images"]),
      );

  static List<String> fromJsonArray(String json) {
    List<String> dataFromJson = [];
    for (var jsonData in jsonDecode(json)) {
      dataFromJson.add(jsonData ?? '');
    }
    return dataFromJson;
  }
}
