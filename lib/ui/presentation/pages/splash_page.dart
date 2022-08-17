import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/resources/routes.dart';
import '../../blocs/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String id = "/splash_page";

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoginSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.bottomNavigationView, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.intro, (route) => false);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: true,
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                KiKPaddings(context).extraLargeVerticalSizedBox(),
                Image.asset(
                  KiKIcons.imgSplashLogo,
                  width: KiKPaddings(context).screenWidth * 0.3,
                ),
                const Spacer(),
                Image.asset(
                  KiKIcons.imgSplashContext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
