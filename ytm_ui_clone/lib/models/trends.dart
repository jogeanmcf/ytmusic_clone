import 'package:ytm_ui_clone/models/yt_search.dart';

enum TrendType {
  videos,
  artists,
  songs,
}

class Trends<T> {
  // String type;
  List<T> items;
  String? playlist;
  Trends(
      {
      // required this.type,
      required this.items,
      this.playlist});

  static Trends fromJson<T>(Map<String, dynamic> json, TrendType type) {
    switch (type) {
      case TrendType.artists:
        final data = json['artists'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<ArtistsTrend>((item) => ArtistsTrend.fromJson(item))
            .toList();
        return Trends(items: items, playlist: playlist);

      case TrendType.videos:
        final data = json['videos'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<VideosTrend>((item) => VideosTrend.fromJson(item))
            .toList();
        return Trends(items: items, playlist: playlist);
      case TrendType.songs:
        final data = json['songs'];
        final playlist = data["playlist"];
        final items = data['items']
            .map<SongsTrend>((item) => SongsTrend.fromJson(item))
            .toList();
        return Trends(items: items, playlist: playlist);
      default:
        return Trends(items: []);
    }
  }

  // static Trends getTrendsOfType<TrendType>(Map<String, dynamic> json) {
  //   switch (Type) {
  //     case Type:
  //       print('artists');
  //       return fromJson(json['artists']);
  //     case Songs:
  //       print('songs');
  //       return fromJson(json['songs']);
  //     case Videos:
  //       print('videos');
  //       return fromJson(json['videos']);

  //     default:
  //       print('Things did not work well');
  //       return Trends(items: []);
  //   }
  // }
}

class ArtistsTrend {
  String browseId;
  String rank;
  String subscribers;
  List<Thumbnail> thumbnails;
  String title;
  String trend;
  final TrendType type = TrendType.artists;

  ArtistsTrend(
      {required this.browseId,
      required this.rank,
      required this.subscribers,
      required this.thumbnails,
      required this.title,
      required this.trend});

  @override
  ArtistsTrend.fromJson(Map<String, dynamic> json)
      : browseId = json["browseId"],
        rank = json["rank"],
        subscribers = json["subscribers"],
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        title = json["title"],
        trend = json["trend"];
}

class VideosTrend {
  List<Artist> artists;
  List<Thumbnail> thumbnails;
  String playlistId;
  String title;
  String videoId;
  String views;
  final TrendType type = TrendType.videos;

  VideosTrend(
      {required this.artists,
      required this.thumbnails,
      required this.playlistId,
      required this.title,
      required this.videoId,
      required this.views});

  @override
  VideosTrend.fromJson(Map<String, dynamic> json)
      : artists = Artist.listOf(json["artists"]),
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        playlistId = json["playlistId"],
        title = json["title"],
        videoId = json["videoId"],
        views = json["views"];
}

class SongsTrend {
  Album album;
  List<Artist> artists;
  bool isExplicit;
  String rank;
  List<Thumbnail> thumbnails;
  String title;
  String trend;
  String videoId;
  final TrendType type = TrendType.songs;

  @override
  String toString() {
    return 'songs';
  }

  SongsTrend({
    required this.album,
    required this.artists,
    required this.isExplicit,
    required this.rank,
    required this.thumbnails,
    required this.title,
    required this.trend,
    required this.videoId,
  });

  @override
  SongsTrend.fromJson(Map<String, dynamic> json)
      : album = Album.fromJson(json["album"]),
        artists = Artist.listOf(json["artists"]),
        isExplicit = json["isExplicit"],
        rank = json["rank"],
        thumbnails = Thumbnail.thumbnails(json["thumbnails"]),
        title = json["title"],
        trend = json["trend"],
        videoId = json["videoId"];
}
