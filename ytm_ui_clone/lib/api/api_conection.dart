import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ytm_ui_clone/models/get_home.dart';
import 'package:ytm_ui_clone/models/mood_and_genres.dart';
import 'package:ytm_ui_clone/models/trends.dart';
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
    final List data = jsonDecode(response.body);
    return HomeSession.listOf(data);
  }

  static Future<List<MoodAndGenre>> getMoodsAndGenres() async {
    final response = await get(Uri.http('localhost:5000', 'moods-and-genres'));
    final data = jsonDecode(response.body);
    return MoodAndGenre.listOf(data);
  }

  static Future<Map<String, dynamic>> getTrends() async {
    final response = await get(Uri.http('localhost:5000', 'trends'));
    return jsonDecode(response.body);
  }

  // static Future<Trends> getVideosTrends<VideosTrend>() async {
  //   final response = await get(Uri.http('localhost:5000', 'trends'));
  //   final data = jsonDecode(response.body);
  //   return Trends.fromJson<VideosTrend>(data, TrendType.videos);
  // }

  // static Future<Trends> getSongsTrends<SongsTrend>() async {
  //   final response = await get(Uri.http('localhost:5000', 'trends'));
  //   final data = jsonDecode(response.body);
  // return Trends.fromJson<SongsTrend>(data, TrendType.songs);
}

  // static Future<Trends> getArtistsTrends<ArtistsTrend>() async {
  //   final response = await get(Uri.http('localhost:5000', 'trends'));
  //   final data = jsonDecode(response.body);

  //   return Trends.fromJson<ArtistsTrend>(data, TrendType.artists);
  // }

