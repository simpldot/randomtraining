// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingAdapter extends TypeAdapter<Training> {
  @override
  final int typeId = 2;

  @override
  Training read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Training(
      fields[0] as String,
      fields[1] as String,
    )..blocks = (fields[2] as HiveList)?.castHiveList();
  }

  @override
  void write(BinaryWriter writer, Training obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.blocks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
