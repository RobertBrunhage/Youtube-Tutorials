import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:material_animations/pages/home/tabs/business_tab.dart';
import 'package:material_animations/pages/home/tabs/home_tab.dart';
import 'package:material_animations/pages/home/tabs/school_tab.dart';
import 'package:material_animations/pages/selected_item_page/selected_item_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final _textStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final _tabs = <Widget>[
    HomeTab(textStyle: _textStyle),
    BusinessTab(textStyle: _textStyle),
    SchoolTab(textStyle: _textStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _tabs[_selectedIndex],
        ),
      ),
      floatingActionButton: OpenContainer(
        closedBuilder: (context, action) {
          return FloatingActionButton(onPressed: action);
        },
        openBuilder: (context, action) {
          return SelectedItemPage(seletedItem: 1);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
