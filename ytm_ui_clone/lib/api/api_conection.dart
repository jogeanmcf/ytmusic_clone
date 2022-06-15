import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ytm_ui_clone/models/get_home.dart';
import 'package:ytm_ui_clone/models/yt_search.dart';

class API {
  static Future<List<YTSearch>> search(String text) async {
    //TODO: implement try catch erro
    final response = await get(Uri.http('localhost:5000', text));
    List data = jsonDecode(response.body);
    return data.map<YTSearch>((item) => YTSearch.fromJson(item)).toList();
  }

  static Future<List<HomeSession>> getHome() async {
    //TODO: implement try catch erro
    final response = await get(Uri.http('localhost:5000', 'home'));
    List data = jsonDecode(response.body);
    return HomeSession.listOf(data);
  }
}
