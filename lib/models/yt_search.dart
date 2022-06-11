import 'dart:convert';

enum ResultType {
  playlist,
  song,
  video,
  artist,
  album,
  none,
}

class YTSearch {
  // this property is commom to every
  String category;
  String resultType;
  List<Thumbnail>? thumbnails;
  // related to playlist
  String? title;
  String? type;
  String? duration;
  String? year;
  List<Artist>? artists;
  String? artist;
  Album? album;
  String? author;
  String? views;
  String? itemCount;
  int? durationSeconds;

  YTSearch(
      {required this.category,
      required this.resultType,
      this.thumbnails,
      this.title,
      this.type,
      this.duration,
      this.year,
      this.author,
      this.artists,
      this.artist,
      this.album,
      this.views,
      this.itemCount,
      this.durationSeconds});

  // YTSearch.fromJson(Map<String, dynamic> json)
  //     : category = json['category'],
  //       resultType = json['resultType'],
  //       thumbnails = Thumbnail.thumbnails(json['thumbnails']),
  //       title = json['title'] ?? '',
  //       artist = json['artist'] ?? '';

  factory YTSearch.fromJson(Map<String, dynamic> json) {
    switch (json['resultType']) {
      case 'playlist':
        return YTSearch(
            author: json['author'],
            // browseId
            category: json['category'],
            itemCount: json['itemCount'],
            resultType: json['resultType'],
            thumbnails: Thumbnail.thumbnails(json['thumbnails']),
            title: json['title']);

      case 'song':
        return YTSearch(
            album: Album.fromJson(json['album']),
            artists: Artist.listOf(json['artists']),
            // browseId
            category: json['category'],
            duration: json['duration'],
            // durationSeconds
            // feedbackTokens
            // isExplicit
            resultType: json['resultType'],
            thumbnails: Thumbnail.thumbnails(json['thumbnails']),
            title: json['title'],
            // videoId
            year: json['year']);

      case 'video':
        return YTSearch(
            artists: Artist.listOf(json['artists']),
            category: json['category'],
            duration: json['duration'],
            // durationSeconds
            resultType: json['resultType'],
            thumbnails: Thumbnail.thumbnails(json['thumbnails']),
            title: json['title'],
            // videoId
            // views
            year: json['year']);

      case 'artist':
        return YTSearch(
            artist: json['artist'],
            // browseId
            category: json['category'],
            // radioId
            resultType: json['resultType'],
            // shuffleId
            thumbnails: Thumbnail.thumbnails(json['thumbnails']));
      case 'album':
        return YTSearch(
            artists: Artist.listOf(json['artists']),
            // browseId
            category: json['category'],
            duration: json['duration'],
            // isExplicit
            resultType: json['resultType'],
            thumbnails: Thumbnail.thumbnails(json['thumbnails']),
            title: json['title'],
            type: json['type'],
            year: json['year']);

      default:
        return YTSearch(category: '', resultType: '');
    }
  }
}

class Thumbnail {
  String url;
  int width;
  int heigh;
  Thumbnail(this.url, this.width, this.heigh);

  Thumbnail.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        width = json['width'],
        heigh = json['height'];

  static List<Thumbnail> thumbnails(List<dynamic> list) {
    return list.map((item) => Thumbnail.fromJson(item)).toList();
  }
}

class Artist {
  String? name;
  String? id;

  Artist(this.name, this.id);

  Artist.fromJson(Map<String?, dynamic> json)
      : name = json['name'],
        id = json['id'];

  static List<Artist> listOf(List? list) {
    if (list == null) return [];
    return list.map((item) => Artist.fromJson(item)).toList();
  }
}

class Album {
  // Some times comes with name and id
  String? name;
  String? id;
  // Some times comes with browseId and title
  String? browseId;
  String? title;

  Album({this.name, this.id, this.browseId, this.title});

  Album.fromJson(Map<String?, dynamic> json)
      : name = json['name'],
        id = json['id'],
        browseId = json['browseId'],
        title = json['title'];
}
