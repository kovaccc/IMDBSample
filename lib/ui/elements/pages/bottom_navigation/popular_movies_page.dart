import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:imdb_sample/ui/blocs/movie_details/movie_details_bloc.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';
import 'package:imdb_sample/ui/elements/widgets/movie_item.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import 'package:imdb_sample/util/error_handler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../generated/l10n.dart';
import '../../widgets/dialogs.dart';

class PopularMoviesPage extends StatefulWidget {
  static const String id = "/popular_movies_page";

  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 0);

  late SnackBar _snackBar;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      print("matej addPageRequestListener");
      BlocProvider.of<PopularMoviesBloc>(context)
          .add(PopularMoviesFetchStarted(pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PopularMoviesBloc, PopularMoviesState>(
          listener: (context, state) {
            if (state is PopularMoviesLoaded) {
              _pagingController.appendPage(state.movies, state.currentPage);
              ScaffoldMessenger.of(context).clearSnackBars();
            } else if (state is PopularMoviesError) {
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
            }
          },
        ),
        BlocListener<MovieDetailsBloc, MovieDetailsState>(
          listener: (context, state) {
            if (state is MovieDetailsLoaded) {
              if (state.updateError) {
                showErrorDialog(
                  context,
                  S.of(context).error,
                  S.of(context).update_favourite_failure,
                );
              }
            }
          },
        ),
      ],
      child: Scaffold(
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
                  child: PagedListView<int, Movie>.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Movie>(
                      itemBuilder: (context, item, index) =>
                          ValueListenableBuilder(
                        valueListenable:
                            BlocProvider.of<MovieDetailsBloc>(context)
                                .getMovieListenable(item.id),
                        builder: (context, Box<DBMovie> box, widget) {
                          final movie =
                              (box.get(item.id) as DBMovie).asDomain();
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MovieDetailsPage.id,
                                  arguments: movie.id);
                            },
                            child: MovieItem(
                              movie: movie,
                            ),
                          );
                        },
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return ImdbPaddings(context).smallVerticalSizedBox();
                    },
                  ),
                ),
              ],
            ),
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
