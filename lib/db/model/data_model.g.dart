// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModalAdapter extends TypeAdapter<StudentModal> {
  @override
  final int typeId = 0;

  @override
  StudentModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModal(
      name: fields[0] as String,
      classs: fields[1] as String,
      divission: fields[2] as String,
      rollno: fields[3] as String,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.classs)
      ..writeByte(2)
      ..write(obj.divission)
      ..writeByte(3)
      ..write(obj.rollno)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
