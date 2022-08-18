import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/presentation/widgets/movie_item.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/loading_overlay.dart';

class PopularMoviesPage extends StatefulWidget {
  static const String id = "/popular_movies_page";

  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<PopularMoviesBloc>(context)
          .add(PopularMoviesFetchStarted(pageKey));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PopularMoviesBloc, PopularMoviesState>(
      listener: (context, state) {
        if (state is PopularMoviesLoaded) {
          _pagingController.appendPage(state.movies, state.pageKey);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).popular,
                  style: ImdbTextStyles.title1SfWhiteBold),
              ImdbPaddings(context).smallVerticalSizedBox(),
              Expanded(
                child: PagedListView<int, Movie>(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Movie>(
                    itemBuilder: (context, item, index) => MovieItem(
                      movie: item,
                    ),
                  ),
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
