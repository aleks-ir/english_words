class ImageResponseDto {
  final List<Image> images;

  ImageResponseDto({
    required this.images,
  });

  factory ImageResponseDto.fromJson(Map<String, dynamic> json) {
    return ImageResponseDto(
      images:
      Image.fromJsonArray(json['photos']),
    );
  }
}

class Image {
  final ImageSrc imageSrc;

  Image({
    required this.imageSrc,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageSrc: ImageSrc.fromJson(json['src']),
    );
  }

  static List<Image> fromJsonArray(List<dynamic> jsonArray) {
    List<Image> definitionsFromJson = [];

    for (var jsonData in jsonArray) {
      definitionsFromJson.add(Image.fromJson(jsonData));
    }

    return definitionsFromJson;
  }
}

class ImageSrc {
  final String url;

  ImageSrc({
    required this.url,
  });

  factory ImageSrc.fromJson(Map<String, dynamic> json) {
    return ImageSrc(
      url: json['medium'],
    );
  }
}