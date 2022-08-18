// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) {
  return _MovieResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieResponse {
  bool get adult =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds => throw _privateConstructorUsedError;
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'original_language')
  String get originalLanguage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'poster_path')
  String? get posterPath =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get video =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'vote_average')
  double get voteAverage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieResponseCopyWith<MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseCopyWith<$Res> {
  factory $MovieResponseCopyWith(
          MovieResponse value, $Res Function(MovieResponse) then) =
      _$MovieResponseCopyWithImpl<$Res>;
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      int id,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class _$MovieResponseCopyWithImpl<$Res>
    implements $MovieResponseCopyWith<$Res> {
  _$MovieResponseCopyWithImpl(this._value, this._then);

  final MovieResponse _value;
  // ignore: unused_field
  final $Res Function(MovieResponse) _then;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieResponseCopyWith<$Res>
    implements $MovieResponseCopyWith<$Res> {
  factory _$$_MovieResponseCopyWith(
          _$_MovieResponse value, $Res Function(_$_MovieResponse) then) =
      __$$_MovieResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      int id,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class __$$_MovieResponseCopyWithImpl<$Res>
    extends _$MovieResponseCopyWithImpl<$Res>
    implements _$$_MovieResponseCopyWith<$Res> {
  __$$_MovieResponseCopyWithImpl(
      _$_MovieResponse _value, $Res Function(_$_MovieResponse) _then)
      : super(_value, (v) => _then(v as _$_MovieResponse));

  @override
  _$_MovieResponse get _value => super._value as _$_MovieResponse;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$_MovieResponse(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieResponse implements _MovieResponse {
  _$_MovieResponse(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') required this.backdropPath,
      @JsonKey(name: 'genre_ids') required final List<int> genreIds,
      required this.id,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') required this.originalTitle,
      required this.overview,
      required this.popularity,
      @JsonKey(name: 'poster_path') required this.posterPath,
      @JsonKey(name: 'release_date') required this.releaseDate,
      required this.title,
      required this.video,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount})
      : _genreIds = genreIds;

  factory _$_MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MovieResponseFromJson(json);

  @override
  final bool adult;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
// ignore: invalid_annotation_target
  final List<int> _genreIds;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  final String title;
  @override
  final bool video;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'MovieResponse(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieResponse &&
            const DeepCollectionEquality().equals(other.adult, adult) &&
            const DeepCollectionEquality()
                .equals(other.backdropPath, backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.originalLanguage, originalLanguage) &&
            const DeepCollectionEquality()
                .equals(other.originalTitle, originalTitle) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality()
                .equals(other.voteAverage, voteAverage) &&
            const DeepCollectionEquality().equals(other.voteCount, voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adult),
      const DeepCollectionEquality().hash(backdropPath),
      const DeepCollectionEquality().hash(_genreIds),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(originalLanguage),
      const DeepCollectionEquality().hash(originalTitle),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(popularity),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(voteAverage),
      const DeepCollectionEquality().hash(voteCount));

  @JsonKey(ignore: true)
  @override
  _$$_MovieResponseCopyWith<_$_MovieResponse> get copyWith =>
      __$$_MovieResponseCopyWithImpl<_$_MovieResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieResponseToJson(
      this,
    );
  }
}

abstract class _MovieResponse implements MovieResponse {
  factory _MovieResponse(
      {required final bool adult,
      @JsonKey(name: 'backdrop_path')
          required final String? backdropPath,
      @JsonKey(name: 'genre_ids')
          required final List<int> genreIds,
      required final int id,
      @JsonKey(name: 'original_language')
          required final String originalLanguage,
      @JsonKey(name: 'original_title')
          required final String originalTitle,
      required final String overview,
      required final double popularity,
      @JsonKey(name: 'poster_path')
          required final String? posterPath,
      @JsonKey(name: 'release_date')
          required final String releaseDate,
      required final String title,
      required final bool video,
      @JsonKey(name: 'vote_average')
          required final double voteAverage,
      @JsonKey(name: 'vote_count')
          required final int voteCount}) = _$_MovieResponse;

  factory _MovieResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieResponse.fromJson;

  @override
  bool get adult;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  String get overview;
  @override
  double get popularity;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  String get title;
  @override
  bool get video;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$_MovieResponseCopyWith<_$_MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
