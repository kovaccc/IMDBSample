import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/providers/splash/splash_state.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'login_page.dart';

class SplashPage extends ConsumerWidget {
  static const String id = "/splash_page";

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SplashState>(
      splashNotifierProvider,
      (SplashState? previousState, SplashState newState) {
        newState.maybeMap(
          orElse: () {},
          loaded: (_) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                BottomNavigationPage.id, (route) => false);
          },
          error: (_) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
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
