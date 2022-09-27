class MoodAndGenre {
  final String params;
  final String title;
  MoodAndGenre(this.params, this.title);

  MoodAndGenre.fromJson(Map<String, dynamic> json)
      : params = json["params"],
        title = json["title"];

  static List<MoodAndGenre> listOf(Map<String, dynamic> json) {
    final List genreList = json["Genres"];
    final List moodList = json["Moods & moments"];
    final genres = genreList.map((e) => MoodAndGenre.fromJson(e)).toList();
    final moods = moodList.map((e) => MoodAndGenre.fromJson(e)).toList();
    return [...genres, ...moods]..shuffle();
  }
}
