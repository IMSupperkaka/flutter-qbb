import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    new Home(),
    Text('Index 1: Business'),
    Text('Index 2: School'),
    Text('Index 3: my')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Image.asset('static/images/tabbar/tabbar_homepage_normal@3x.png', width: 20.0, height: 20.0),
              activeIcon: new Image.asset('static/images/tabbar/tabbar_homepage_select@3x.png', width: 20.0, height: 20.0),
              title: new Container(
                child: new Text('首页'),
                margin: const EdgeInsets.only(top: 4.0)
              )
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('static/images/tabbar/tabbar_loan_normal@3x.png', width: 20.0, height: 20.0),
              activeIcon: new Image.asset('static/images/tabbar/tabbar_loan_select@3x.png', width: 20.0, height: 20.0),
              title: new Container(
                child: new Text('借款'),
                margin: const EdgeInsets.only(top: 4.0)
              )
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('static/images/tabbar/tabbar_recommend_normal@3x.png', width: 20.0, height: 20.0),
              activeIcon: new Image.asset('static/images/tabbar/tabbar_recommend_select@3x.png', width: 20.0, height: 20.0),
              title: new Container(
                child: new Text('推荐'),
                margin: const EdgeInsets.only(top: 4.0)
              )
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('static/images/tabbar/tabbar_mine_normal@3x.png', width: 20.0, height: 20.0),
              activeIcon: new Image.asset('static/images/tabbar/tabbar_mine_select@3x.png', width: 20.0, height: 20.0),
              title: new Container(
                child: new Text('我的'),
                margin: const EdgeInsets.only(top: 4.0)
              )
          )
        ],
        selectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Color(0xFF509EF3),
        onTap: _onItemTapped
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}