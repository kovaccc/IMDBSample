import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/blocs/movie_details/movie_details_bloc.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/elements/widgets/movie_item.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import 'package:imdb_sample/util/error_handler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../di/injection.dart';
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

    _pagingController.addStatusListener((status) {
      print("  i am here 1");

      final blocState = BlocProvider.of<PopularMoviesBloc>(context).state;
      if (blocState is PopularMoviesError) {
        if (blocState.error is SocketException) {
          print("  i am here 2");
        }
      } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PopularMoviesBloc, PopularMoviesState>(
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
              duration: Duration(hours: 5),
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
            print("hide snackbar");
            ScaffoldMessenger.of(context).clearSnackBars();
          }
        }
      },
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
                          BlocProvider<MovieDetailsBloc>(
                        create: (context) => MovieDetailsBloc(
                          moviesRepository:
                              getIt<IMoviesRepository>() as MoviesRepository,
                        ),
                        child: MovieItem(
                          movie: item,
                        ),
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
