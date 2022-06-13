import 'package:ytmusic_clone/models/yt_search.dart';

class HomeSession {
  String? title;
  List<Content?> contents;

  HomeSession.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        contents = Content.listOf(json["contents"]);

  static List<HomeSession> listOf(List<dynamic> list) {
    return list.map((item) => HomeSession.fromJson(item)).toList();
  }
}

class Content {
  List<Artist>? artists;
  List<Thumbnail>? thumbnails;
  Album? album;
  String? browseId;
  String? title;
  String? year;

  String? videoId;
  String? playlistId;
  String? views;

  Content.fromJson(Map<String?, dynamic> json)
      : artists = Artist.listOf(json["artists"]),
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        // album = Album.fromJson(json["album"]),
        browseId = json["browseId"],
        title = json["title"],
        year = json["year"],
        videoId = json["videoId"],
        playlistId = json["playlistId"],
        views = json["views"];

  static List<Content> listOf(List<dynamic> list) {
    return list.map((item) => Content.fromJson(item)).toList();
  }
}
