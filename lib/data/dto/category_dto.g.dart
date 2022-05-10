// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDtoAdapter extends TypeAdapter<CategoryDto> {
  @override
  final int typeId = 3;

  @override
  CategoryDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDto(
      title: fields[0] as String,
      openingCost: fields[1] as int,
      isEditable: fields[2] as bool,
      wordList: (fields[3] as List).cast<WordDto>(),
      indexIconAsset: fields[4] as int,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.openingCost)
      ..writeByte(2)
      ..write(obj.isEditable)
      ..writeByte(3)
      ..write(obj.wordList)
      ..writeByte(4)
      ..write(obj.indexIconAsset)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
