import 'package:flutter/material.dart';
import 'package:flutterdemoproject/pages/trip_page/home_page.dart';
import 'package:flutterdemoproject/pages/trip_page/trip_main_page.dart';
import 'package:flutterdemoproject/pages/view_page/animation_page.dart';
import 'package:flutterdemoproject/pages/view_page/app_lifecycle.dart';
import 'package:flutterdemoproject/pages/view_page/banner_page.dart';
import 'package:flutterdemoproject/pages/view_page/expansiontile_page.dart';
import 'package:flutterdemoproject/pages/view_page/flutter_layout_page.dart';
import 'package:flutterdemoproject/pages/view_page/flutter_widget_lifecycle.dart';
import 'package:flutterdemoproject/pages/view_page/gesture_page.dart';
import 'package:flutterdemoproject/pages/view_page/gridview_page.dart';
import 'package:flutterdemoproject/pages/view_page/http_page.dart';
import 'package:flutterdemoproject/pages/view_page/launch_page.dart';
import 'package:flutterdemoproject/pages/view_page/listview_page.dart';
import 'package:flutterdemoproject/pages/view_page/photo_app.dart';
import 'package:flutterdemoproject/pages/view_page/res_page.dart';
import 'package:flutterdemoproject/pages/view_page/shared_preferences_page.dart';
import 'package:flutterdemoproject/pages/view_page/statefull_group_page.dart';
import 'package:flutterdemoproject/pages/view_page/stateless_group_page.dart';
import 'package:flutterdemoproject/pages/view_page/plugin_use.dart';
import 'package:flutterdemoproject/pages/view_page/tab_navigator.dart';
import 'package:flutterdemoproject/pages/view_page/tabbed_appbar_sample.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

void main() => runApp(DynamicTheme());

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 3600), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          fontFamily: 'RubikMonoOne',
          brightness: _brightness,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('如何创建和使用FLutter的路由与导航')),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.light) {
                      _brightness = Brightness.dark;
                    } else {
                      _brightness = Brightness.light;
                    }
                  });
                },
                child: Text(
                  '切换主题模式 fonts-test',
                  style: TextStyle(fontFamily: 'RubikMonoOne'),
                ),
              ),
              RouteNavigator(),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StateFullGroupPage(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
          'gesture': (BuildContext context) => GesturePage(),
          'res': (BuildContext context) => ResPage(),
          'launch': (BuildContext context) => LaunchPage(),
          'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
          'appLifecycle': (BuildContext context) => AppLifecycle(),
          'photoApp': (BuildContext context) => PhotoApp(),
          'animationPage': (BuildContext context) => AnimationPage(),
          'tabbedAppBarSample': (BuildContext context) => TabbedAppBarSample(),
          'tabNavigator': (BuildContext context) => TabNavigator(),
          'bannerPage': (BuildContext context) => BannerPage(),
          'httpPage': (BuildContext context) => HttpPage(),
          'sharePreferencesPage': (BuildContext context) => SharePreferencesPage(),
          'listViewPage': (BuildContext context) => ListViewPage(),
          'expansionTilePage': (BuildContext context) => ExpansionTilePage(),
          'gridViewPage': (BuildContext context) => GridViewPage(),
          'tripMainPage': (BuildContext context) => TripMainPage(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,//
          children: <Widget>[
            SwitchListTile(
                title: Text('${byName ? '' : '不'}通过路由名跳转'),
                value: byName,
                onChanged: (value) {
                  setState(() {
                    byName = value;
                  });
                }),
            _item('AppDemo首页', TripMainPage(), 'tripMainPage'),
            _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
            _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
            _item('StatefulWidget与基础组件', StateFullGroupPage(), 'ful'),
            _item('如何进行Flutter布局开发', FlutterLayoutPage(), 'layout'),
            _item('如何创建和使用FLutter的路由与导航', GesturePage(), 'gesture'),
            _item('如何导入和使用Flutter的资源文件', ResPage(), 'res'),
            _item('如何打开第三方应用', LaunchPage(), 'launch'),
            _item('页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
            _item('应用生命周期', AppLifecycle(), 'appLifecycle'),
            _item('拍照和相册', PhotoApp(), 'photoApp'),
            _item('动画', AnimationPage(), 'animationPage'),
            _item('顶部导航', TabbedAppBarSample(), 'tabbedAppBarSample'),
            _item('底部导航', TabNavigator(), 'tabNavigator'),
            _item('Banner轮播+appbar滚动渐变', BannerPage(), 'bannerPage'),
            _item('网络请求', HttpPage(), 'httpPage'),
            _item('SharePreferences本地存储操作', SharePreferencesPage(), 'sharePreferencesPage'),
            _item('列表下拉刷新+上拉加载更多', ListViewPage(), 'listViewPage'),
            _item('ExpansionTile实现可展开列表', ExpansionTilePage(), 'expansionTilePage'),
            _item('GridView实现网格布局', GridViewPage(), 'gridViewPage'),

          ],
        )
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
