import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:words_3000_puzzle/common/exception.dart';

import '../../../common/constants/api_keys.dart';
import '../../../domain/datasources/remote/word_api.dart';
import '../../dto/word_response_dto.dart';


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
