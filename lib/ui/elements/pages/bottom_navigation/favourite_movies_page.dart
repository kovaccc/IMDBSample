import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import '../../../../config/keys.dart';
import '../../../../data/models/persistence/db_movie.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/paddings.dart';
import '../../../resources/routes.dart';
import '../../../resources/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/movie_item.dart';

class FavouriteMoviesPage extends ConsumerWidget {
  const FavouriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: K.favouriteMoviesPage,
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
                  valueListenable: ref.read(favouriteMoviesProvider),
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
                            context.beamToNamed(
                                "$homePagePath$favouritePagePath/${favouriteMovies[index].id.toString()}");
                          },
                          child: MovieItem(
                            key: Key(
                                "${index}_${S.of(context).favourites}"),
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
