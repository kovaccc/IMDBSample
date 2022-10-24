import 'dart:io';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:imdb_sample/ui/elements/widgets/movie_item.dart';
import 'package:imdb_sample/ui/providers/movie_details/movie_details_state.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_state.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import 'package:imdb_sample/util/error_handler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../config/keys.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/routes.dart';
import '../../widgets/dialogs.dart';

class PopularMoviesPage extends ConsumerStatefulWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<PopularMoviesPage> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 0);

  late SnackBar _snackBar;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      ref
          .read(popularMoviesNotifierProvider.notifier)
          .fetchNextPopularMovies(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<MovieDetailsState>(
      movieDetailsNotifierProvider,
      (MovieDetailsState? previousState, MovieDetailsState newState) {
        newState.maybeMap(
          orElse: () {},
          updateError: (_) {
            showErrorDialog(
              context,
              S.of(context).error,
              S.of(context).update_favourite_failure,
            );
          },
          updateSuccess: (_) {},
        );
      },
    );
    ref.listen<PopularMoviesState>(
      popularMoviesNotifierProvider,
      (PopularMoviesState? previousState, PopularMoviesState newState) {
        newState.maybeMap(
          orElse: () {},
          loaded: (state) {
            _pagingController.appendPage(state.movies, state.currentPage);
            ScaffoldMessenger.of(context).clearSnackBars();
          },
          error: (state) {
            final Exception error = state.error;
            if (error is PageNumberError) {
              _pagingController.appendLastPage(state.movies);
            } else if (state.movies.isEmpty) {
              _pagingController.error = error;
              showErrorDialog(
                context,
                S.of(context).error,
                ErrorHandler.resolveExceptionMessage(error),
              );
            } else {
              _pagingController.appendPage(state.movies, state.currentPage);
            }

            if (error is SocketException) {
              _snackBar = SnackBar(
                elevation: 5,
                duration: const Duration(hours: 5),
                backgroundColor: ImdbColors.primaryOrange,
                dismissDirection: DismissDirection.none,
                content: Text(S.of(context).network_connection_not_available),
                action: SnackBarAction(
                  onPressed: () {},
                  label: "",
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            } else {
              ScaffoldMessenger.of(context).clearSnackBars();
            }
          },
        );
      },
    );
    final movies = ref.watch(popularMoviesNotifierProvider).movies;
    return Scaffold(
      key: K.popularMoviesPage,
      body: SafeArea(
        child: Padding(
          padding: ImdbPaddings.horizontal16Padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).popular,
                  style: ImdbTextStyles.title1SfWhiteBold),
              ImdbPaddings(context).smallVerticalSizedBox(),
              Expanded(
                // child: ListView.builder(
                //   key: K.popularMoviesListView,
                //   itemCount: movies.length,
                //   itemBuilder: (context, index) {
                //     return GestureDetector(
                //       onTap: () {
                //         context.beamToNamed(
                //             "$homePagePath$popularPagePath/${movies[index].id.toString()}");
                //       },
                //       child: MovieItem(
                //         key: Key(
                //             "${movies[index].title}_${S.of(context).popular}"),
                //         movie: movies[index],
                //       ),
                //     );
                //   },
                // ),
                child: PagedListView<int, Movie>.separated(
                  key: K.popularMoviesPagedListView,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Movie>(
                      itemBuilder: (context, item, index) {
                    return ValueListenableBuilder(
                      valueListenable: ref.read(movieProvider(item.id)),
                      builder: (context, Box<DBMovie> box, widget) {
                        final dbMovie = box.get(item.id);
                        if (dbMovie != null) {
                          final movie = dbMovie.asDomain();
                          return GestureDetector(
                            onTap: () {
                              context.beamToNamed(
                                  "$homePagePath$popularPagePath/${movie.id.toString()}");
                            },
                            child: MovieItem(
                              key: Key(
                                  "${movie.localId}_${S.of(context).popular}"),
                              movie: movie,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return ImdbPaddings(context).smallVerticalSizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
