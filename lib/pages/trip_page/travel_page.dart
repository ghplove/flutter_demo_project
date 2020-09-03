import 'package:flutter/material.dart';
import 'package:flutterdemoproject/dao/travel_dao.dart';
import 'package:flutterdemoproject/dao/travel_tab_dao.dart';
import 'package:flutterdemoproject/model/travel_tab_model.dart';
import 'package:flutterdemoproject/pages/trip_page/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then((TravelTabModel model) {
      _controller = TabController(
          length: model.tabs.length, vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: TabBar(
                controller: _controller,
                isScrollable: true,
                //左右滑动
                labelColor: Colors.black,
                labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff2fcfbd), width: 3),
                  insets: EdgeInsets.only(bottom: 10),
                ),
                tabs: tabs.map<Tab>((TravelTab tab) {
                  return Tab(
                    text: tab.labelName,
                  );
                }).toList()),
          ),
          Flexible(
            //撑开包括的内容，解决Horizontal viewport was given unbounded height.
            child: TabBarView(
                controller: _controller,
                children: tabs.map((TravelTab tab) {
                  return TravelTabPage(
                    travelUrl: travelTabModel.url,
                    params: travelTabModel.params,
                    groupChannelCode: tab.groupChannelCode,
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
