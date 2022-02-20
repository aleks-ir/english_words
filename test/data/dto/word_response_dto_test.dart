import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:words_3000_puzzle/data/dto/word_response_dto.dart';

import '../../fixtures/fixture_reader.dart';




void main() {
  final tWordResponseDto = WordResponseDto(definitionAndExample: [
    DefinitionAndExample(definition: 'Test definition 1', example: 'Test example 1'),
    DefinitionAndExample(definition: 'Test definition 2', example: 'Test example 2'),
  ].toList(), pronunciation: '', word: 'test');

  test(
    'should be a subclass of WordResponseDto',
    () async {
      expect(tWordResponseDto, isA<WordResponseDto>());
    },
  );


    test(
      'should return a valid WordResponseDto',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('word_response.json'));
        final result = WordResponseDto.fromJson(jsonMap);
        expect(result.word, tWordResponseDto.word);
        expect(result.pronunciation, tWordResponseDto.pronunciation);
        expect(result.definitionAndExample, tWordResponseDto.definitionAndExample);
      },
    );

}
