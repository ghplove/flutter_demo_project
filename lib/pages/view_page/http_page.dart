import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http'),
          leading: BackButton(),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                fetchPost()
                    .then((CommonModel value) {
                      setState(() {
                        showResult =
                            '请求结果：\nhideAppBar: ${value.hideAppBar}\nicon: ${value.icon}';
                      });
                    }, onError: (e) {})
                    .catchError(() {})
                    .whenComplete(() {})
                    .timeout(Duration(milliseconds: 5), onTimeout: () {});
              },
              child: Text(
                '点击',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(showResult),
            FutureBuilder<CommonModel>(
              future: fetchPost(),
              builder:
                  (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return new Text('Input a URL to start');

                  case ConnectionState.waiting:
                    return new Center(
                      child: new CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    return new Text('');
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text(
                        '${snapshot.hasError}',
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          Text('icon:${snapshot.data.icon}'),
                          Text(
                              'statusBarColor:${snapshot.data.statusBarColor}'),
                          Text('title:${snapshot.data.title}'),
                          Text('url:${snapshot.data.url}'),
                        ],
                      );
                    }
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}

class TravelTabModel {
  String url;
  List<TravelTab> tabs;

  TravelTabModel({this.url, this.tabs});

  TravelTabModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    (json['tabs'] as List).map((i) => TravelTab.fromJson(i));
  }
}

class TravelTab {
  String title;

  TravelTab({this.title});

  TravelTab.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}
