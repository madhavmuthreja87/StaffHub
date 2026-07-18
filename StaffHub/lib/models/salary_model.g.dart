// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalaryModelAdapter extends TypeAdapter<SalaryModel> {
  @override
  final int typeId = 2;

  @override
  SalaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalaryModel(
      salaryid: fields[0] as String,
      staffid: fields[1] as String,
      salary: fields[2] as double,
      date: fields[3] as DateTime,
      deduction: fields[4] as double,
      ispaid: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SalaryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.salaryid)
      ..writeByte(1)
      ..write(obj.staffid)
      ..writeByte(2)
      ..write(obj.salary)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.deduction)
      ..writeByte(5)
      ..write(obj.ispaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
