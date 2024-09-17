// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardDataAdapter extends TypeAdapter<CardData> {
  @override
  final int typeId = 0;

  @override
  CardData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardData(
      isChecked: fields[0] as bool,
      data: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isChecked)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
