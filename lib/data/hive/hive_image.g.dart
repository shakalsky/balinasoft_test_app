// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageDbAdapter extends TypeAdapter<ImageDb> {
  @override
  final int typeId = 0;

  @override
  ImageDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageDb(
      id: fields[0] as int,
      dateTime: fields[1] as DateTime,
      imagePath: fields[2] as String?,
      latitude: fields[3] as Double,
      longitude: fields[4] as Double,
    );
  }

  @override
  void write(BinaryWriter writer, ImageDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
