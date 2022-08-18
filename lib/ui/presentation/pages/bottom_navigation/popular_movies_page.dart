import 'package:flutter/material.dart';
import 'package:imdb_sample/common/resources/paddings.dart';
import 'package:imdb_sample/common/resources/text_styles.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/ui/presentation/widgets/movie_item.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/loading_overlay.dart';

class PopularMoviesPage extends StatelessWidget {
  static const String id = "/popular_movies_page";

  PopularMoviesPage({Key? key}) : super(key: key);

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).popular,
                style: ImdbTextStyles.title1SfWhiteBold),
            ImdbPaddings(context).smallVerticalSizedBox(),
            MovieItem()
          ],
        ),
      ),
    );
  }
}
