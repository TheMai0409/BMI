// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bmi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBMIAdapter extends TypeAdapter<UserBMI> {
  @override
  final int typeId = 0;

  @override
  UserBMI read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBMI(
      height: fields[0] as double?,
      weight: fields[1] as double?,
      dateTime: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserBMI obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBMIAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
