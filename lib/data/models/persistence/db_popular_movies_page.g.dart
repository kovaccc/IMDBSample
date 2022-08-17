// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_popular_movies_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBPopularMoviesPageAdapter extends TypeAdapter<DBPopularMoviesPage> {
  @override
  final int typeId = 2;

  @override
  DBPopularMoviesPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBPopularMoviesPage(
      page: fields[0] as int,
      movies: (fields[1] as HiveList).castHiveList(),
      totalPages: fields[2] as int,
      totalResults: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DBPopularMoviesPage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.movies)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBPopularMoviesPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
