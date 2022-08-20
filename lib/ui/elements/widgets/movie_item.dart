import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb_sample/config/constants.dart';
import 'package:imdb_sample/ui/elements/widgets/movie_information_item.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import '../../../data/models/domain/movie.dart';
import '../../resources/text_styles.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: CachedNetworkImage(
              placeholderFadeInDuration: const Duration(seconds: 2),
              fit: BoxFit.fill,
              height: double.infinity,
              width: 130,
              imageUrl: "${Constants.movieImageBaseUrl}${movie.backdropPath}",
              placeholder: (context, url) => const CircularProgressIndicator(
                  color: ImdbColors.primaryOrange),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MovieInformationItem(
                movie: movie,
                titleTextStyle: ImdbTextStyles.heading2SfWhiteBold,
                genreTextStyle: ImdbTextStyles.paragraph3SfWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
