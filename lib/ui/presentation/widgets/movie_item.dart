import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/common/resources/colors.dart';
import '../../../common/resources/icons.dart';
import '../../../common/resources/paddings.dart';
import '../../../common/resources/text_styles.dart';
import '../../../data/models/domain/movie.dart';
import '../../../generated/l10n.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: CachedNetworkImage(
              imageUrl:
                  "https://image.tmdb.org/t/p/w500/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
              placeholder: (context, url) => const CircularProgressIndicator(),
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
                        child: Text(
                          movie.title,
                          style: ImdbTextStyles.heading1SfWhiteBold,
                        ),
                      ),
                      SvgPicture.asset(
                        IMDBIcons.favouriteFalse,
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
                      Text(S.of(context).evaluation(10000),
                          style: ImdbTextStyles.paragraph2SfWhite),
                    ],
                  ),
                  ImdbPaddings(context).extraSmallVerticalSizedBox(),
                  SizedBox(
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: ImdbColors.primaryBrown,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("GEnre",
                              style: ImdbTextStyles.paragraph3SfWhite),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
