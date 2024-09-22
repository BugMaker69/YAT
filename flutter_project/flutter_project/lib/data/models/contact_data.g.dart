// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactItemDataAdapter extends TypeAdapter<ContactItemData> {
  @override
  final int typeId = 0;

  @override
  ContactItemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactItemData(
      name: fields[1] as String,
      phoneNumber: fields[2] as String,
      email: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactItemData obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactItemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
