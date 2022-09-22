import 'package:ytm_ui_clone/models/yt_search.dart';

// enum TrendType {
//   videos,
//   artists,
//   songs,
// }

class Trends<TrendType> {
  // String type;
  List<TrendType> items;
  String? playlist;

  Trends({
    required this.items,
    this.playlist,
  });

  static Trends fromJson<T>(Map<String, dynamic> json, String type) {
    switch (type) {
      case 'artists':
        final data = json['artists'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<OfTypeArtists>((item) => OfTypeArtists.fromJson(item))
            .toList();
        return Trends<OfTypeArtists>(items: items, playlist: playlist);

      case 'videos':
        final data = json['videos'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<OfTypeVideos>((item) => OfTypeVideos.fromJson(item))
            .toList();
        return Trends<OfTypeVideos>(items: items, playlist: playlist);

      case 'songs':
        final data = json['songs'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<OfTypeSongs>((item) => OfTypeSongs.fromJson(item))
            .toList();
        return Trends<OfTypeSongs>(items: items, playlist: playlist);

      default:
        print('default foi chamado');
        return Trends(items: []);
    }
  }
}

class TrendType {}

class OfTypeArtists extends TrendType {
  String browseId;
  String rank;
  String subscribers;
  List<Thumbnail> thumbnails;
  String title;
  String trend;

  OfTypeArtists(
      {required this.browseId,
      required this.rank,
      required this.subscribers,
      required this.thumbnails,
      required this.title,
      required this.trend});

  OfTypeArtists.fromJson(Map<String?, dynamic> json)
      : browseId = json["browseId"],
        rank = json["rank"],
        subscribers = json["subscribers"],
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        title = json["title"],
        trend = json["trend"];
}

class OfTypeVideos extends TrendType {
  List<Artist> artists;
  List<Thumbnail> thumbnails;
  String playlistId;
  String title;
  String videoId;
  String views;

  OfTypeVideos(
      {required this.artists,
      required this.thumbnails,
      required this.playlistId,
      required this.title,
      required this.videoId,
      required this.views});

  OfTypeVideos.fromJson(Map<String?, dynamic> json)
      : artists = Artist.listOf(json["artists"]),
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        playlistId = json["playlistId"],
        title = json["title"],
        videoId = json["videoId"],
        views = json["views"];
}

class OfTypeSongs extends TrendType {
  Album? album;
  List<Artist>? artists;
  bool? isExplicit;
  String? rank;
  List<Thumbnail>? thumbnails;
  String? title;
  String? trend;
  String? videoId;

  OfTypeSongs({
    required this.album,
    required this.artists,
    required this.isExplicit,
    required this.rank,
    required this.thumbnails,
    required this.title,
    required this.trend,
    required this.videoId,
  });

  OfTypeSongs.fromJson(Map<String?, dynamic> json)
      : album = Album.fromJson(json["album"]),
        artists = Artist.listOf(json["artists"]),
        isExplicit = json["isExplicit"],
        rank = json["rank"],
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        title = json["title"],
        trend = json["trend"],
        videoId = json["videoId"];
}
