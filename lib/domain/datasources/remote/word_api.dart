import '../../../data/dto/word_response_dto.dart';

abstract class WordApi {

  Future<WordResponseDto> getWordResponseFromApi(String wordTitle);
  
}