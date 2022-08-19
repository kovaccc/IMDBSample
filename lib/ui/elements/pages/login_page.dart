import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/ui/blocs/login/login_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';

import '../../../generated/l10n.dart';
import '../widgets/loading_overlay.dart';

class LoginPage extends StatelessWidget {
  static const String id = "/login_page";

  LoginPage({Key? key}) : super(key: key);

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) {
        return previous is LoginLoading || current is LoginLoading;
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          _loadingOverlay.show(context);
        } else {
          _loadingOverlay.hide();
          Navigator.of(context).pushNamedAndRemoveUntil(
              BottomNavigationPage.id, (route) => false);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: ImdbPaddings(context).screenHeight * 0.1,
              width: ImdbPaddings(context).screenHeight * 0.2,
              child: TextButton(
                onPressed: () {
                  loginBloc.add(const LoginStarted());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ImdbColors.primaryOrange, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  S.of(context).login,
                  style: ImdbTextStyles.heading1SfWhiteBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
