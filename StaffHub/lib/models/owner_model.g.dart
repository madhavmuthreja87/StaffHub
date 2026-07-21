// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OwnerModelAdapter extends TypeAdapter<OwnerModel> {
  @override
  final int typeId = 3;

  @override
  OwnerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OwnerModel(
      ownerid: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      shopname: fields[3] as String,
      shopaddress: fields[4] as String,
      businesstype: fields[5] as String,
      profileImage: fields[6] as String,
      stafflist: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, OwnerModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ownerid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.shopname)
      ..writeByte(4)
      ..write(obj.shopaddress)
      ..writeByte(5)
      ..write(obj.businesstype)
      ..writeByte(6)
      ..write(obj.profileImage)
      ..writeByte(7)
      ..write(obj.stafflist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
