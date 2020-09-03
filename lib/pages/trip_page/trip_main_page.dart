import 'package:flutter/material.dart';
import 'package:flutterdemoproject/pages/trip_page/home_page.dart';
import 'package:flutterdemoproject/pages/trip_page/my_page.dart';
import 'package:flutterdemoproject/pages/trip_page/search_page.dart';
import 'package:flutterdemoproject/pages/trip_page/travel_page.dart';

class TripMainPage extends StatefulWidget {
  @override
  _TripMainPageState createState() => _TripMainPageState();
}

class _TripMainPageState extends State<TripMainPage> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  List<TabItem> _tabs = <TabItem>[
    TabItem(page: HomePage(), title: '首页', icon: Icons.home),
    TabItem(page: SearchPage(hideLeft: true, ), title: '搜索', icon: Icons.search),
    TabItem(page: TravelPage(), title: '旅拍', icon: Icons.camera_alt),
    TabItem(page: MyPage(), title: '我的', icon: Icons.account_circle),
  ];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _getWidget(),
        physics: NeverScrollableScrollPhysics(),//从来不滚动，禁止左右滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: _createBottomTabs(),
      ),
    );
  }

  List<Widget> _getWidget() {
    return _tabs.map((tabItem){
      return tabItem.page;
    }).toList();
  }

  List<BottomNavigationBarItem> _createBottomTabs() {
    return _tabs.map((tabItem) {
      return _createBottomTabsItem(
          tabItem.title, tabItem.icon, _tabs.indexOf(tabItem));
    }).toList();
  }

  BottomNavigationBarItem _createBottomTabsItem(title, icon, index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: _currentIndex == index ? _activeColor : _defaultColor),
      ),
    );
  }
}

class TabItem {
  const TabItem({this.page, this.title, this.icon});

  final Widget page;
  final String title;
  final IconData icon;
}

