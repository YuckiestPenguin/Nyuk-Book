// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:acnh_buddy/fishes/fishes_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
      theme: ThemeData(
        primaryColor: Color(0xff235789),
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xff121212)),
          color: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          textTheme: TextTheme(
            headline2: TextStyle(color: Colors.black),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    FishesScreen(),
    Text('2'),
    Text('3'),
    Text('sd')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AC:NH Buddy!', style: Theme
            .of(context)
            .textTheme
            .headline4,),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme
            .of(context)
            .primaryColor,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fish),
            title: Text('Fishes'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.spider),
            title: Text('Bugs'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.skull),
            title: Text('Fossils'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAstronaut),
            title: Text('Villagers'),
          ),
        ],
      ),
    );
  }
}
