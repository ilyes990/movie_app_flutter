class Film {
  String title;
  String overview;
  String originalTitle;
  String posterPath;
  String releaseDate;
  dynamic voteAverage;
  String backDropPath;

  Film({
    required this.title,
    required this.overview,
    required this.backDropPath,
    required this.originalTitle,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json["title"],
      overview: json["overview"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
    );
  }
}
