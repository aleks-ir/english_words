import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/common/constants/api_keys.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/data/datasources/remote/word_api_impl.dart';
import 'package:words_3000_puzzle/data/dto/word_response_dto.dart';

import '../../../fixtures/fixture_reader.dart';
import 'word_api_impl_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {

  group('getWordResponseFromApi', () {
    final mockHttpClient = MockClient();
    final dataSource = WordApiImpl(client: mockHttpClient);

    const tWordTitle = 'test';
    final tWordResponseDto =
        WordResponseDto.fromJson(json.decode(fixture('word_response.json')));
    final tUrl = Uri.https('owlbot.info', 'api/v4/dictionary/$tWordTitle');
    final tHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Token ${ApiKeys.wordKey}",
    };

    test(
      'Should perform a GET request on a URL',
      () async {
        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
                (_) async => http.Response(fixture('word_response.json'), 200));
        dataSource.getWordResponseFromApi(tWordTitle);
        verify(mockHttpClient.get(tUrl, headers: tHeaders));
      },
    );

    test(
      'Should return WordResponseDto when the response code is 200 (success)',
      () async {
        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
            (_) async => http.Response(fixture('word_response.json'), 200));
        final result = await dataSource.getWordResponseFromApi(tWordTitle);
        expect(result.word, tWordResponseDto.word);
      },
    );

    test(
      'Should throw a Exception when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        final call = dataSource.getWordResponseFromApi(tWordTitle);
        expect(() => call, throwsA(AppException.server()));
      },
    );
  });
}
