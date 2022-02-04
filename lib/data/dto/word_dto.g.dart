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
      imageLinksList: (fields[1] as List).cast<String>(),
      meaningList: (fields[2] as List).cast<String>(),
      examplesList: (fields[3] as List).cast<String>(),
      status: fields[4] as String,
      studyDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WordDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageLinksList)
      ..writeByte(2)
      ..write(obj.meaningList)
      ..writeByte(3)
      ..write(obj.examplesList)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.studyDate);
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
