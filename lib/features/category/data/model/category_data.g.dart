// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDataAdapter extends TypeAdapter<CategoryData> {
  @override
  final int typeId = 3;

  @override
  CategoryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryData(
      id: fields[0] as int?,
      name: fields[1] as String?,
      nameEn: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
