// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffModelAdapter extends TypeAdapter<StaffModel> {
  @override
  final int typeId = 0;

  @override
  StaffModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffModel(
      staffid: fields[0] as String,
      ownerid: fields[1] as String,
      name: fields[2] as String,
      email: fields[3] as String,
      address: fields[4] as String,
      role: fields[5] as String,
      salary: fields[6] as double,
      profileImage: fields[7] as String,
      joiningDate: fields[8] as DateTime,
      todayPresent: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StaffModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.staffid)
      ..writeByte(1)
      ..write(obj.ownerid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.salary)
      ..writeByte(7)
      ..write(obj.profileImage)
      ..writeByte(8)
      ..write(obj.joiningDate)
      ..writeByte(9)
      ..write(obj.todayPresent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
