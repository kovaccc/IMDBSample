import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/config/constants.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import '../../../data/models/domain/movie.dart';
import '../../../generated/l10n.dart';
import '../../blocs/movie_details/movie_details_bloc.dart';
import 'dialogs.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailsBloc, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsUpdateError) {
          showErrorDialog(
            context,
            S.of(context).error,
            S.of(context).update_favourite_failure,
          );
        }
      },
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: CachedNetworkImage(
                placeholderFadeInDuration: const Duration(seconds: 3),
                fit: BoxFit.fill,
                height: double.infinity,
                width: 130,
                imageUrl: "${Constants.movieImageBaseUrl}${movie.backdropPath}",
                placeholder: (context, url) =>
                const CircularProgressIndicator(
                    color: ImdbColors.primaryOrange),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              movie.title,
                              style: ImdbTextStyles.heading1SfWhiteBold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<MovieDetailsBloc>(context).add(
                                MovieDetailsFavouriteUpdated(movie));
                          },
                          child: BlocBuilder<MovieDetailsBloc,
                              MovieDetailsState>(
                            builder: (context, state) {
                              var isFavourite = movie.isFavourite;
                              if (state is MovieDetailsLoaded) {
                                isFavourite = state.movie.isFavourite;
                              }
                              return SvgPicture.asset(
                                isFavourite
                                    ? IMDBIcons.favouriteTrue
                                    : IMDBIcons.favouriteFalse,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    ImdbPaddings(context).extraSmallVerticalSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          IMDBIcons.star,
                        ),
                        const SizedBox(width: 5),
                        Text(S.of(context).evaluation(movie.voteAverage ?? 0),
                            style: ImdbTextStyles.paragraph2SfWhite),
                      ],
                    ),
                    ImdbPaddings(context).extraSmallVerticalSizedBox(),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: movie.genres.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: ImdbColors.primaryBrown,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(movie.genres[index].name,
                                      style: ImdbTextStyles.paragraph3SfWhite),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
