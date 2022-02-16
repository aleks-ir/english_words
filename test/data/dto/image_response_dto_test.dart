import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:words_3000_puzzle/data/dto/image_response_dto.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tImageResponseDto = ImageResponseDto(images: [
    Image(imageSrc: ImageSrc(url: 'https://api.test.com/medium')),
    Image(imageSrc: ImageSrc(url: 'https://api.test.com/medium')),
  ]);

  test(
    'should be a subclass of ImageResponseDto',
    () async {
      expect(tImageResponseDto, isA<ImageResponseDto>());
    },
  );

  test(
    'should return a valid ImageResponseDto',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('image_response.json'));
      final result = ImageResponseDto.fromJson(jsonMap);
      expect(result.images, tImageResponseDto.images);
    },
  );
}
