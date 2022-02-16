


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

  @override
  String toString() {
    return 'ImageResponseDto{images: $images}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageResponseDto &&
          runtimeType == other.runtimeType &&
          images == other.images;

  @override
  int get hashCode => images.hashCode;
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

  @override
  String toString() {
    return 'Image{imageSrc: $imageSrc}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image &&
          runtimeType == other.runtimeType &&
          imageSrc == other.imageSrc;

  @override
  int get hashCode => imageSrc.hashCode;
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

  @override
  String toString() {
    return 'ImageSrc{url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSrc && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;
}