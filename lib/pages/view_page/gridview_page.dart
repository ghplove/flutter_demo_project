import 'package:flutter/material.dart';

List<String> cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrideView网格布局'),
        leading: BackButton(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

}
