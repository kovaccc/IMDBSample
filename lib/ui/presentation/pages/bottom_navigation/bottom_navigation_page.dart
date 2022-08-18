import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imdb_sample/common/resources/text_styles.dart';
import 'package:imdb_sample/ui/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:imdb_sample/ui/presentation/pages/bottom_navigation/popular_movies_page.dart';
import '../../../../common/resources/icons.dart';
import '../../../../data/repositories/movies_repository.dart';
import '../../../../di/injection.dart';
import '../../../../generated/l10n.dart';

class BottomNavigationPage extends StatefulWidget {
  static const id = "/bottom_navigation_page";

  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
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
        leading: SvgPicture.asset(IMDBIcons.imdbLogo),
        leadingWidth: 100,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => PopularMoviesBloc(
            moviesRepository: getIt<IMoviesRepository>() as MoviesRepository),
        child: const PopularMoviesPage(),
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
