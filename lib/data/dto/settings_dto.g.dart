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
      hasLocalData: fields[0] == null ? false : fields[0] as bool,
      theme: fields[1] == null ? 'light' : fields[1] as String,
      isVibration: fields[2] == null ? true : fields[2] as bool,
      isNotification: fields[3] == null ? false : fields[3] as bool,
      timeNotification: fields[4] == null ? '12:00' : fields[4] as String,
      wordCount: fields[5] == null ? 10 : fields[5] as int,
      starCount: fields[6] == null ? 0 : fields[6] as int,
      selectedCategory:
          fields[7] == null ? 'settings_key' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.hasLocalData)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.isVibration)
      ..writeByte(3)
      ..write(obj.isNotification)
      ..writeByte(4)
      ..write(obj.timeNotification)
      ..writeByte(5)
      ..write(obj.wordCount)
      ..writeByte(6)
      ..write(obj.starCount)
      ..writeByte(7)
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