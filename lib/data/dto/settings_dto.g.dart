// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsDtoAdapter extends TypeAdapter<SettingsDto> {
  @override
  final int typeId = 1;

  @override
  SettingsDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsDto(
      hasLocalData: fields[0] as bool,
      darkThemeIsEnabled: fields[1] as bool,
      viewCarouselIsEnabled: fields[2] as bool,
      isVibration: fields[3] as bool,
      isNotification: fields[4] as bool,
      timeNotification: fields[5] as String,
      wordToExploreCount: fields[6] as int,
      day: fields[7] as int,
      flameCount: fields[8] as int,
      selectedCategory: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsDto obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.hasLocalData)
      ..writeByte(1)
      ..write(obj.darkThemeIsEnabled)
      ..writeByte(2)
      ..write(obj.viewCarouselIsEnabled)
      ..writeByte(3)
      ..write(obj.isVibration)
      ..writeByte(4)
      ..write(obj.isNotification)
      ..writeByte(5)
      ..write(obj.timeNotification)
      ..writeByte(6)
      ..write(obj.wordToExploreCount)
      ..writeByte(7)
      ..write(obj.day)
      ..writeByte(8)
      ..write(obj.flameCount)
      ..writeByte(9)
      ..write(obj.selectedCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
