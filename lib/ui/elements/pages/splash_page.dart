import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/providers/splash/splash_state.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';

import '../../resources/routes.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SplashState>(
      splashNotifierProvider,
      (SplashState? previousState, SplashState newState) {
        newState.maybeMap(
          orElse: () {},
          loaded: (_) {
            context.beamToReplacementNamed(homePagePath);
          },
          error: (_) {
            context.beamToReplacementNamed(loginPagePath);
          },
        );
      },
    );

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          ImdbIcons.imdbLogo,
          height: ImdbPaddings(context).screenWidth / 5,
          width: ImdbPaddings(context).screenWidth / 5,
        ),
      ),
    );
  }
}
