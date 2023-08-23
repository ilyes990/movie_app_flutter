// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:movies_app/API/films.dart';
import 'package:movies_app/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _PlayingNowURL =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const _UpcomingURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const basicURI =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  late List<Film> searchresult;

  Future<List<Film>> searchpopularmovies({String? query}) async {
    final response = await http.get(Uri.parse(basicURI));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      print(decodedData);

      searchresult = decodedData.map((e) => Film.fromJson(e)).toList();
      if (query != null) {
        searchresult = searchresult
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    } else {
      throw Exception('Something wrong happened ');
    }
    return searchresult;
  }

  Future<List<Film>> getnowPlayingFilms() async {
    final response = await http.get(Uri.parse(_PlayingNowURL));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((e) => Film.fromJson(e)).toList();
    } else {
      throw Exception('Something wrong happened');
    }
  }

  Future<List<Film>> getUpcomingFilms() async {
    final response = await http.get(Uri.parse(_UpcomingURL));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;

      return decodedData.map((e) => Film.fromJson(e)).toList();
    } else {
      throw Exception('Something wrong happened');
    }
  }
}
