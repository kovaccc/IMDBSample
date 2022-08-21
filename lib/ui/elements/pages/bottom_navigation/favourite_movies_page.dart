import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';

import '../../../../data/models/persistence/db_movie.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/paddings.dart';
import '../../../resources/text_styles.dart';
import '../../widgets/movie_item.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ImdbPaddings.horizontal16Padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).favourites,
                  style: ImdbTextStyles.title1SfWhiteBold),
              ImdbPaddings(context).smallVerticalSizedBox(),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: BlocProvider.of<PopularMoviesBloc>(context)
                      .getPopularMoviesListenable(),
                  builder: (context, Box<DBMovie> box, widget) {
                    var favouriteMovies = (box.values
                            .where((element) => element.isFavourite == true)
                            .toList())
                        .asDomain();
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: favouriteMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(MovieDetailsPage.id,
                                arguments: favouriteMovies[index].id);
                          },
                          child: MovieItem(
                            movie: favouriteMovies[index],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return ImdbPaddings(context).smallVerticalSizedBox();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
