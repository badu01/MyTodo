// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoListAdapter extends TypeAdapter<ToDoList> {
  @override
  final int typeId = 0;

  @override
  ToDoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoList(
      Todo: fields[0] as String,
      createDate: fields[1] as DateTime,
      finishdate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Todo)
      ..writeByte(1)
      ..write(obj.createDate)
      ..writeByte(2)
      ..write(obj.finishdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
