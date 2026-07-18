// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaveModelAdapter extends TypeAdapter<LeaveModel> {
  @override
  final int typeId = 4;

  @override
  LeaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeaveModel(
      leaveid: fields[0] as String,
      staffid: fields[1] as String,
      reason: fields[2] as String,
      isFullDay: fields[3] as bool,
      leavedate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.leaveid)
      ..writeByte(1)
      ..write(obj.staffid)
      ..writeByte(2)
      ..write(obj.reason)
      ..writeByte(3)
      ..write(obj.isFullDay)
      ..writeByte(4)
      ..write(obj.leavedate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
