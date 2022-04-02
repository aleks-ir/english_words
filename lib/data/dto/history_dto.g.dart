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
      date: fields[0] as String,
      wordExploredCount: fields[1] as int,
      wordToExploreCount: fields[2] as int,
      awardWasReceived: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.wordExploredCount)
      ..writeByte(2)
      ..write(obj.wordToExploreCount)
      ..writeByte(3)
      ..write(obj.awardWasReceived);
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
