import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/favourite_movies_page.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/popular_movies_page.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/icons.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';
import '../../../../generated/l10n.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IMDBIcons.bottomNavMovies),
            label: S.of(context).movies,
            backgroundColor: ImdbColors.primaryBlack,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IMDBIcons.bottomNavFavourites),
            activeIcon: ,
            label: S.of(context).favourites,
            backgroundColor: ImdbColors.primaryBlack,
          ),
        ],
        backgroundColor: ImdbColors.primaryBlack,
        currentIndex: _selectedIndex,
        selectedItemColor: ImdbColors.primaryOrange,

        selectedIconTheme: const IconThemeData(color: ImdbColors.primaryOrange),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: ImdbTextStyles.paragraph2SfWhiteBold,
        selectedLabelStyle: ImdbTextStyles.paragraph2SfOrangeBold,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: _widgetOptions.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: S.of(context).movies,
    //         backgroundColor: Colors.red,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.business),
    //         label: 'Business',
    //         backgroundColor: Colors.green,
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Colors.amber[800],
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}
