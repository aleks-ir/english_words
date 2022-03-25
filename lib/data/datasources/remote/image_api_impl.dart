import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:word_study_puzzle/common/constants/api_keys.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/data/dto/image_response_dto.dart';
import 'package:word_study_puzzle/domain/datasources/remote/image_api.dart';

class ImageApiImpl implements ImageApi {
  final http.Client client;

  ImageApiImpl({required this.client});

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": ApiKeys.imageKey,
      };


  @override
  Future<ImageResponseDto> getImageResponseFromApi(String wordTitle) async {
    final url = Uri.https('api.pexels.com', '/v1/search', {
      'query': wordTitle,
      'per_page': '80',
      'orientation': 'landscape'
    });
    final response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return ImageResponseDto.fromJson(json.decode(response.body));
    } else {
      throw AppException.server();
    }
  }
}
