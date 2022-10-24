// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'popular_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PopularMoviesState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        initial,
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        loaded,
    required TResult Function(List<Movie> movies, int currentPage,
            bool isLastPage, Exception error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopularMoviesStateCopyWith<PopularMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesStateCopyWith(
          PopularMoviesState value, $Res Function(PopularMoviesState) then) =
      _$PopularMoviesStateCopyWithImpl<$Res>;
  $Res call({List<Movie> movies, int currentPage, bool isLastPage});
}

/// @nodoc
class _$PopularMoviesStateCopyWithImpl<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  _$PopularMoviesStateCopyWithImpl(this._value, this._then);

  final PopularMoviesState _value;
  // ignore: unused_field
  final $Res Function(PopularMoviesState) _then;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(_value.copyWith(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> movies, int currentPage, bool isLastPage});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PopularMoviesStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(_$_Initial(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<Movie> movies,
      required this.currentPage,
      required this.isLastPage})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int currentPage;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'PopularMoviesState.initial(movies: $movies, currentPage: $currentPage, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.isLastPage, isLastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(isLastPage));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        initial,
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        loaded,
    required TResult Function(List<Movie> movies, int currentPage,
            bool isLastPage, Exception error)
        error,
  }) {
    return initial(movies, currentPage, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
  }) {
    return initial?.call(movies, currentPage, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(movies, currentPage, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PopularMoviesState {
  const factory _Initial(
      {required final List<Movie> movies,
      required final int currentPage,
      required final bool isLastPage}) = _$_Initial;

  @override
  List<Movie> get movies;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> movies, int currentPage, bool isLastPage});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$PopularMoviesStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(_$_Loaded(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<Movie> movies,
      required this.currentPage,
      required this.isLastPage})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int currentPage;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'PopularMoviesState.loaded(movies: $movies, currentPage: $currentPage, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.isLastPage, isLastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(isLastPage));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        initial,
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        loaded,
    required TResult Function(List<Movie> movies, int currentPage,
            bool isLastPage, Exception error)
        error,
  }) {
    return loaded(movies, currentPage, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
  }) {
    return loaded?.call(movies, currentPage, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(movies, currentPage, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PopularMoviesState {
  const factory _Loaded(
      {required final List<Movie> movies,
      required final int currentPage,
      required final bool isLastPage}) = _$_Loaded;

  @override
  List<Movie> get movies;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Movie> movies, int currentPage, bool isLastPage, Exception error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$PopularMoviesStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? isLastPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required final List<Movie> movies,
      required this.currentPage,
      required this.isLastPage,
      required this.error})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int currentPage;
  @override
  final bool isLastPage;
  @override
  final Exception error;

  @override
  String toString() {
    return 'PopularMoviesState.error(movies: $movies, currentPage: $currentPage, isLastPage: $isLastPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.isLastPage, isLastPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(isLastPage),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        initial,
    required TResult Function(
            List<Movie> movies, int currentPage, bool isLastPage)
        loaded,
    required TResult Function(List<Movie> movies, int currentPage,
            bool isLastPage, Exception error)
        error,
  }) {
    return error(movies, currentPage, isLastPage, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
  }) {
    return error?.call(movies, currentPage, isLastPage, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        initial,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage)?
        loaded,
    TResult Function(List<Movie> movies, int currentPage, bool isLastPage,
            Exception error)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(movies, currentPage, isLastPage, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PopularMoviesState {
  const factory _Error(
      {required final List<Movie> movies,
      required final int currentPage,
      required final bool isLastPage,
      required final Exception error}) = _$_Error;

  @override
  List<Movie> get movies;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  Exception get error;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
