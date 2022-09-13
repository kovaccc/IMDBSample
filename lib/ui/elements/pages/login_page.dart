import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import '../../../generated/l10n.dart';
import '../../providers/login/login_state.dart';
import '../widgets/loading_overlay.dart';

class LoginPage extends ConsumerWidget {
  static const String id = "/login_page";

  LoginPage({Key? key}) : super(key: key);

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(
      loginNotifierProvider,
      (LoginState? previousState, LoginState newState) {
        newState.maybeMap(
          orElse: () {},
          loading: (_) {
            _loadingOverlay.show(context);
          },
          loaded: (_) {
            _loadingOverlay.hide();
            Navigator.of(context).pushNamedAndRemoveUntil(
                BottomNavigationPage.id, (route) => false);
          },
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: ImdbPaddings(context).screenHeight * 0.1,
            width: ImdbPaddings(context).screenHeight * 0.2,
            child: TextButton(
              onPressed: () {
                ref.read(loginNotifierProvider.notifier).startLogin();
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
    );
  }
}
