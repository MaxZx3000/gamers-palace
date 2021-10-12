import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/home/creators-list-fragment.dart';
import 'package:flutter_pemula_app/activity/home/games-list-fragment.dart';
import 'package:flutter_pemula_app/activity/home/internet-fragment.dart';
import 'package:flutter_pemula_app/activity/home/publishers-list-fragment.dart';
import 'package:flutter_pemula_app/globals/colors.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My Game Catalog App', home: MyMainPage());
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _selectedIndex = 0;
  int _currentPageDataIndex = 1;
  Icon _nextIcon = new Icon(Icons.navigate_next);
  Icon _previousIcon = new Icon(Icons.navigate_before);
  Widget _appBarTitle;
  Widget _currentPage;

  List<Widget> _widgetTabPage = <InternetFragment>[
    PublisherListFragment(),
    GamesListFragment(),
    CreatorListFragment()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentPageDataIndex = 1;
      _currentPage = _widgetTabPage[_selectedIndex];
    });
  }

  Widget getDefaultTitleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Transform.rotate(
              angle: 45,
              child: Icon(
                Icons.games,
                size: 30,
              )),
        ),
        Text("Gamers' Place",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins'
            ),
        )
      ],
    );
  }

  void onLeftPressed() {
    if (_currentPageDataIndex > 1) {
      setState(() {
        _currentPageDataIndex -= 1;
        (_currentPage as InternetFragment)
            .changeIndexPage(_currentPageDataIndex);
      });
    }
  }

  void onRightPressed() {
    setState(() {
      _currentPageDataIndex += 1;
      (_currentPage as InternetFragment).changeIndexPage(_currentPageDataIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _appBarTitle = getDefaultTitleBar();
    _currentPage = _widgetTabPage[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              BoxDecoration(gradient: CustomGradient.getCommonGradient()),
        ),
        title: _appBarTitle,
        actions: [
          IconButton(
              icon: this._previousIcon,
              onPressed: () {
                onLeftPressed();
              }),
          Center(
            child: Text(
              "${this._currentPageDataIndex}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: this._nextIcon,
            onPressed: () {
              onRightPressed();
            },
          )
        ],
      ),
      body: _currentPage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.colorBurn,
            border: Border(
                top: BorderSide(
                    width: 4, color: Color(CUSTOM_COLORS["darkRed"]))),
            gradient: LinearGradient(colors: [
              Color(CUSTOM_COLORS['darkViolet']),
              Color(CUSTOM_COLORS['darkRed'])
            ])),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Publisher',
                backgroundColor: Color(CUSTOM_COLORS["darkBlue"])),
            BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset),
                label: 'Games',
                backgroundColor: Color(CUSTOM_COLORS["darkViolet"])),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Creators',
                backgroundColor: Color(CUSTOM_COLORS["darkBlue"]))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
