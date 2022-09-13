import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/providers.dart';

import '../../../data/models/domain/movie.dart';
import '../../../generated/l10n.dart';
import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../resources/paddings.dart';
import '../../resources/text_styles.dart';

class MovieInformationItem extends ConsumerWidget {
  final Movie movie;
  final TextStyle titleTextStyle;
  final TextStyle genreTextStyle;

  const MovieInformationItem({
    Key? key,
    required this.movie,
    required this.titleTextStyle,
    required this.genreTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
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
                  style: titleTextStyle,
                ),
              ),
            ),
            InkWell(
              radius: 20,
              highlightColor: ImdbColors.primaryOrange,
              splashColor: ImdbColors.primaryPurple,
              onTap: () {
                ref
                    .read(movieDetailsNotifierProvider(movie.id).notifier)
                    .updateMovieDetailsFavourite();
              },
              child: SvgPicture.asset(
                movie.isFavourite
                    ? ImdbIcons.favouriteTrue
                    : ImdbIcons.favouriteFalse,
                width: 14,
                height: 18,
              ),
            ),
          ],
        ),
        ImdbPaddings(context).extraSmallVerticalSizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImdbIcons.star,
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
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ImdbColors.primaryBrown,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child:
                          Text(movie.genres[index].name, style: genreTextStyle),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
