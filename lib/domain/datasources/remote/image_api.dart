import '../../../data/dto/image_response_dto.dart';

abstract class ImageApi {

  Future<ImageResponseDto> getImageResponseFromApi(String wordTitle);
  
}