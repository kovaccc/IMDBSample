// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBMovieAdapter extends TypeAdapter<DBMovie> {
  @override
  final int typeId = 1;

  @override
  DBMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBMovie(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String?,
      genres: (fields[2] as HiveList).castHiveList(),
      id: fields[3] as int,
      originalLanguage: fields[4] as String,
      originalTitle: fields[5] as String,
      overview: fields[6] as String?,
      popularity: fields[7] as double?,
      posterPath: fields[8] as String?,
      releaseDate: fields[9] as String,
      title: fields[10] as String,
      video: fields[11] as bool?,
      voteAverage: fields[12] as double?,
      voteCount: fields[13] as int?,
      isFavourite: fields[14] as bool,
      page: fields[15] as int?,
      localId: fields[16] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DBMovie obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genres)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount)
      ..writeByte(14)
      ..write(obj.isFavourite)
      ..writeByte(15)
      ..write(obj.page)
      ..writeByte(16)
      ..write(obj.localId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
