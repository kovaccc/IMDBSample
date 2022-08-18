import 'package:flutter/material.dart';


class BottomNavigationPage extends StatefulWidget {
  static const id = "/bottom_navigation_page";

  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text("bottom navigation page"),
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
