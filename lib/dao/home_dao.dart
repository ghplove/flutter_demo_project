import 'dart:async';
import 'dart:convert';//模型转换

import 'package:flutterdemoproject/model/home_model.dart';
import 'package:http/http.dart' as http;//重名时as起别名

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';//数据接口地址

///首页大接口
class HomeDao{
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();//fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}