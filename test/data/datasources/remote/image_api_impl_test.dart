import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/common/constants/api_keys.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/data/datasources/remote/image_api_impl.dart';
import 'package:word_study_puzzle/data/dto/image_response_dto.dart';

import '../../../fixtures/fixture_reader.dart';
import 'word_api_impl_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {

  group('getImageResponseFromApi', () {
    final mockHttpClient = MockClient();
    final dataSource = ImageApiImpl(client: mockHttpClient);

    const tWordTitle = 'test';
    final tImageResponseDto =
        ImageResponseDto.fromJson(json.decode(fixture('image_response.json')));
    final tUrl = Uri.https('api.pexels.com', '/v1/search', {
      'query': tWordTitle,
      'per_page': '80',
      'orientation': 'landscape'
    });
    final tHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": ApiKeys.imageKey,
    };

    test(
      'Should perform a GET request on a URL',
      () async {
        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
                (_) async => http.Response(fixture('image_response.json'), 200));
        dataSource.getImageResponseFromApi(tWordTitle);
        verify(mockHttpClient.get(tUrl, headers: tHeaders));
      },
    );

    test(
      'Should return ImageResponse when the response code is 200 (success)',
      () async {
        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
            (_) async => http.Response(fixture('image_response.json'), 200));

        final result = await dataSource.getImageResponseFromApi(tWordTitle);

        expect(result.images, tImageResponseDto.images);
      },
    );

    test(
      'Should throw a Exception when the response code is 404 or other',
      () async {

        when(mockHttpClient.get(tUrl, headers: tHeaders)).thenAnswer(
                (_) async => http.Response('Something went wrong', 404));

        final call = dataSource.getImageResponseFromApi(tWordTitle);

        expect(() => call, throwsA(AppException.server()));
      },
    );
  });
}
