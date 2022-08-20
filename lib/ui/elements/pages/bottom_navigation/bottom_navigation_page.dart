import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/favourite_movies_page.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/popular_movies_page.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../widgets/bottom_bar_item.dart';

class BottomNavigationPage extends StatefulWidget {
  static const id = "/bottom_navigation_page";

  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    PopularMoviesPage(),
    FavouriteMoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).logout,
              style: ImdbTextStyles.heading1SfWhiteBold,
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(IMDBIcons.imdbLogo),
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
        color: ImdbColors.primaryBlack,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: BottomBarItem(
                  isSelected: _selectedIndex == 0 ? true : false,
                  label: S.of(context).movies,
                  leadingIconPath: IMDBIcons.bottomNavMovies,
                  onPressed: () {
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
                  leadingIconPath: IMDBIcons.bottomNavFavourites,
                  onPressed: () {
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
