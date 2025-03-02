// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NicModelAdapter extends TypeAdapter<NicModel> {
  @override
  final int typeId = 1;

  @override
  NicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NicModel(
      nicNumber: fields[0] as String,
      format: fields[1] as String,
      birthDate: fields[2] as String,
      weekday: fields[3] as String,
      age: fields[4] as int,
      gender: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NicModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nicNumber)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
