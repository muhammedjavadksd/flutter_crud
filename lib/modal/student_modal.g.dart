// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModalAdapter extends TypeAdapter<StudentModal> {
  @override
  final int typeId = 1;

  @override
  StudentModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModal(
      rowid: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.rowid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age);
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
