import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '布局',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('布局'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: Text('个人')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white), //装饰器
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //裁剪为圆形
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.deepPurple),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                //裁剪为方形
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6, //60%透明度
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple),
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Image.network(
                              'https://images5.alphacoders.com/764/764018.png'),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            //PhysicalModel裁剪模式
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: <Widget>[
                                  _item('Page1', Colors.deepPurple),
                                  _item('Page2', Colors.green),
                                  _item('Page3', Colors.red),
                                ],
                                onPageChanged: (position) {},
                                controller: PageController(),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.deepPurple),
                                  child: Text('宽度撑满'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images5.alphacoders.com/764/764018.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.network(
                            'https://images5.alphacoders.com/764/764018.png',
                            width: 36,
                            height: 36,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8, //水平间距
                      runSpacing: 6, //垂直间距
                      children: <Widget>[
                        _chip('Flutter'),
                        _chip('Test'),
                        _chip('APP'),
                        _chip('APP'),
                        _chip('APP'),
                        _chip('APP'),
                      ],
                    ),
                  ],
                ),
                onRefresh: _handleRefresh)
            : Column(
                children: <Widget>[
                  Text('个人'),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('拉伸填满高度'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String lable) {
    return Chip(
      label: Text(lable),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Text(
          lable.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
