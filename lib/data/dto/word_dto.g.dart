// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordDtoAdapter extends TypeAdapter<WordDto> {
  @override
  final int typeId = 4;

  @override
  WordDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordDto(
      title: fields[0] as String,
      imageUrlList: (fields[1] as List).cast<String>(),
      definitionList: (fields[2] as List).cast<String>(),
      examplesList: (fields[3] as List).cast<String>(),
      pronunciation: fields[4] as String,
      status: fields[5] as String,
      repetitionDay: fields[6] as int,
      repetitionNum: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WordDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrlList)
      ..writeByte(2)
      ..write(obj.definitionList)
      ..writeByte(3)
      ..write(obj.examplesList)
      ..writeByte(4)
      ..write(obj.pronunciation)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.repetitionDay)
      ..writeByte(7)
      ..write(obj.repetitionNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
