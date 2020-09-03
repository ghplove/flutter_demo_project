import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blue), //装饰器
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'Text',
                style: textStyle,
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                label: Text('StatelessWidget与基础组件'),
                avatar: Icon(Icons.people),
              ),
              Divider(
                height: 10, //容器高度
                indent: 10, //左右间距
                color: Colors.black,
              ),
              Card(
                //带有圆角，阴影，边框等效果的卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('title'),
                content: Text('content'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

