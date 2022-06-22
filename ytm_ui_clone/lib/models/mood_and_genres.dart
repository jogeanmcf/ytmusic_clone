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
    //TODO: mudar os nomes asdfs
    final asdf1 = genreList.map((e) => MoodAndGenre.fromJson(e)).toList();
    final asdf2 = moodList.map((e) => MoodAndGenre.fromJson(e)).toList();
    return [...asdf1, ...asdf2];
  }
}
