import 'package:flutter/material.dart';
import 'package:flutterdemoproject/pages/view_page/flutter_layout_page.dart';
import 'package:flutterdemoproject/pages/view_page/plugin_use.dart';
import 'package:flutterdemoproject/pages/view_page/statefull_group_page.dart';
import 'package:flutterdemoproject/pages/view_page/stateless_group_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  List<TabItem> _tabs = <TabItem>[
    TabItem(page: PluginUse(), title: '首页', icon: Icons.home),
    TabItem(page: LessGroupPage(), title: '搜索', icon: Icons.search),
    TabItem(page: StateFullGroupPage(), title: '旅拍', icon: Icons.camera_alt),
    TabItem(page: FlutterLayoutPage(), title: '我的', icon: Icons.account_circle),
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
        physics: NeverScrollableScrollPhysics(),
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

