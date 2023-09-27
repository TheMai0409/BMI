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
      dateTime: fields[0] as String?,
      bmi: fields[1] as double?,
      age: fields[2] as int?,
      gender: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserBMI obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.bmi)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.gender);
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
