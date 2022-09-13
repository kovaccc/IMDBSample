import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/elements/widgets/movie_information_item.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';

import '../../../config/constants.dart';
import '../../../data/models/persistence/db_movie.dart';
import '../../../generated/l10n.dart';
import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../resources/paddings.dart';

class MovieDetailsPage extends ConsumerWidget {
  static const String id = "/movie_details_page";

  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;

    return ValueListenableBuilder(
      valueListenable: ref.read(movieProvider(movieId)),
      builder: (BuildContext context, Box<DBMovie> box, Widget? child) {
        final movie = (box.get(movieId) as DBMovie).asDomain();
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      placeholderFadeInDuration: const Duration(seconds: 2),
                      fit: BoxFit.fitWidth,
                      height: ImdbPaddings(context).screenHeight * 0.40,
                      width: double.infinity,
                      imageUrl:
                          "${Constants.movieImageBaseUrl}${movie.posterPath}",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                              color: ImdbColors.primaryOrange),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          alignment: Alignment.topLeft,
                          ImdbIcons.backArrow,
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                ImdbPaddings(context).mediumVerticalSizedBox(),
                Padding(
                  padding: ImdbPaddings.horizontal16Padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieInformationItem(
                        movie: movie,
                        titleTextStyle: ImdbTextStyles.heading1SfWhiteBold,
                        genreTextStyle: ImdbTextStyles.paragraph2SfWhite,
                      ),
                      ImdbPaddings(context).mediumVerticalSizedBox(),
                      Text(S.of(context).description,
                          style: ImdbTextStyles.heading2SfWhiteBold),
                      ImdbPaddings(context).extraSmallVerticalSizedBox(),
                      Text(movie.overview ?? "",
                          style: ImdbTextStyles.paragraph1SfWhiteLight)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
