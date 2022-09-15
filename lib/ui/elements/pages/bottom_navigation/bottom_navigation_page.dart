import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/common/enums/filter_movies.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/favourite_movies_page.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/popular_movies_page.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import '../../../../data/repositories/movies_repository.dart';
import '../../../../di/injection.dart';
import '../../../../generated/l10n.dart';
import '../../../providers/auth/auth_state.dart';
import '../../../resources/routes.dart';
import '../../widgets/bottom_bar_item.dart';

class BottomNavigationPage extends ConsumerStatefulWidget {
  final int initialIndex;

  const BottomNavigationPage({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends ConsumerState<BottomNavigationPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    BlocProvider(
      create: (context) => PopularMoviesBloc(
        moviesRepository: getIt<IMoviesRepository>() as MoviesRepository,
      ),
      child: const PopularMoviesPage(),
    ),
    const FavouriteMoviesPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(
      authNotifierProvider,
      (AuthState? previousState, AuthState newState) {
        newState.maybeMap(
          orElse: () {},
          signedOut: (_) {
            context.beamToReplacementNamed(loginPagePath);
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(authNotifierProvider.notifier).startLogout();
              },
              child: Text(
                S.of(context).logout,
                style: ImdbTextStyles.heading1SfWhiteBold,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(ImdbIcons.imdbLogo),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ImdbColors.secondaryBlack,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: BottomBarItem(
                  isSelected: _selectedIndex == 0 ? true : false,
                  label: S.of(context).movies,
                  leadingIconPath: ImdbIcons.bottomNavMovies,
                  onPressed: () {
                    Beamer.of(context).update(
                      configuration: RouteInformation(
                          location:
                              FilterMovies.popular.getQueryTabPath()),
                      rebuild: false,
                    );
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: BottomBarItem(
                  isSelected: _selectedIndex == 1 ? true : false,
                  label: S.of(context).favourites,
                  leadingIconPath: ImdbIcons.bottomNavFavourites,
                  onPressed: () {
                    Beamer.of(context).update(
                      configuration: RouteInformation(
                          location:
                          FilterMovies.favourite.getQueryTabPath()),
                      rebuild: false,
                    );
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
