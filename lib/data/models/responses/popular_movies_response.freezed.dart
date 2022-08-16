// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'popular_movies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PopularMoviesResponse _$PopularMoviesResponseFromJson(
    Map<String, dynamic> json) {
  return _PopularMoviesResponse.fromJson(json);
}

/// @nodoc
mixin _$PopularMoviesResponse {
  int get page => throw _privateConstructorUsedError;
  List<MovieResponse> get results =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'total_pages')
  int get totalPages =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularMoviesResponseCopyWith<PopularMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMoviesResponseCopyWith<$Res> {
  factory $PopularMoviesResponseCopyWith(PopularMoviesResponse value,
          $Res Function(PopularMoviesResponse) then) =
      _$PopularMoviesResponseCopyWithImpl<$Res>;
  $Res call(
      {int page,
      List<MovieResponse> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$PopularMoviesResponseCopyWithImpl<$Res>
    implements $PopularMoviesResponseCopyWith<$Res> {
  _$PopularMoviesResponseCopyWithImpl(this._value, this._then);

  final PopularMoviesResponse _value;
  // ignore: unused_field
  final $Res Function(PopularMoviesResponse) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResponse>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PopularMoviesResponseCopyWith<$Res>
    implements $PopularMoviesResponseCopyWith<$Res> {
  factory _$$_PopularMoviesResponseCopyWith(_$_PopularMoviesResponse value,
          $Res Function(_$_PopularMoviesResponse) then) =
      __$$_PopularMoviesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      List<MovieResponse> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$$_PopularMoviesResponseCopyWithImpl<$Res>
    extends _$PopularMoviesResponseCopyWithImpl<$Res>
    implements _$$_PopularMoviesResponseCopyWith<$Res> {
  __$$_PopularMoviesResponseCopyWithImpl(_$_PopularMoviesResponse _value,
      $Res Function(_$_PopularMoviesResponse) _then)
      : super(_value, (v) => _then(v as _$_PopularMoviesResponse));

  @override
  _$_PopularMoviesResponse get _value =>
      super._value as _$_PopularMoviesResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_PopularMoviesResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResponse>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PopularMoviesResponse implements _PopularMoviesResponse {
  _$_PopularMoviesResponse(
      {required this.page,
      required final List<MovieResponse> results,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _results = results;

  factory _$_PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PopularMoviesResponseFromJson(json);

  @override
  final int page;
  final List<MovieResponse> _results;
  @override
  List<MovieResponse> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'PopularMoviesResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PopularMoviesResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$$_PopularMoviesResponseCopyWith<_$_PopularMoviesResponse> get copyWith =>
      __$$_PopularMoviesResponseCopyWithImpl<_$_PopularMoviesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PopularMoviesResponseToJson(
      this,
    );
  }
}

abstract class _PopularMoviesResponse implements PopularMoviesResponse {
  factory _PopularMoviesResponse(
          {required final int page,
          required final List<MovieResponse> results,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'total_results') required final int totalResults}) =
      _$_PopularMoviesResponse;

  factory _PopularMoviesResponse.fromJson(Map<String, dynamic> json) =
      _$_PopularMoviesResponse.fromJson;

  @override
  int get page;
  @override
  List<MovieResponse> get results;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_PopularMoviesResponseCopyWith<_$_PopularMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
