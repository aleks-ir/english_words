// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryDtoAdapter extends TypeAdapter<HistoryDto> {
  @override
  final int typeId = 2;

  @override
  HistoryDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryDto(
      data: fields[0] as String,
      wordCount: fields[1] as int,
      wasWordsExplored: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.wordCount)
      ..writeByte(2)
      ..write(obj.wasWordsExplored);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
