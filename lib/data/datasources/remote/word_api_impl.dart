import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:word_study_puzzle/common/constants/api_keys.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/data/dto/word_response_dto.dart';
import 'package:word_study_puzzle/domain/datasources/remote/word_api.dart';


class WordApiImpl implements WordApi {
  final http.Client client;

  WordApiImpl({required this.client});


  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Token ${ApiKeys.wordKey}",
  };

  @override
  Future<WordResponseDto> getWordResponseFromApi(String wordTitle) async {

    final url = Uri.https('owlbot.info', 'api/v4/dictionary/$wordTitle');
    final response = await client.get(
      url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {

      return WordResponseDto.fromJson(json.decode(response.body));
    } else {
      throw AppException.server();
    }
  }
}
