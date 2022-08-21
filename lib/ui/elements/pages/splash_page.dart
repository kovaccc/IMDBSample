import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import '../../blocs/splash/splash_bloc.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash_page";

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoginSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              BottomNavigationPage.id, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            ImdbIcons.imdbLogo,
            height: ImdbPaddings(context).screenWidth / 5,
            width: ImdbPaddings(context).screenWidth / 5,
          ),
        ),
      ),
    );
  }
}
