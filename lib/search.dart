// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:movies_app/API/api.dart';
import 'package:movies_app/API/films.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/details_screen.dart';

class SearchMovie extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  final Api _filmList = Api();
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Background/Movie_background_FIGMA.jpg"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Theme(
            //   data: ThemeData(
            //     primaryColor: Colors.grey,
            //     primaryColorDark: Colors.grey,
            //   ),
            //   child: TextField(
            //     controller: _searchController,
            //     onChanged: (query) {},
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           borderSide: BorderSide(
            //               width: 3,
            //               color: const Color.fromARGB(255, 234, 232, 225))),
            //       hintText: "Search for movie",
            //       hintStyle:
            //           TextStyle(color: Color.fromARGB(190, 184, 184, 184)),
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Color.fromARGB(190, 184, 184, 184),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: FutureBuilder<List<Film>>(
                  future: _filmList.searchpopularmovies(query: query),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Film>? data = snapshot.data;
                    return ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                    "${Constants.imgPath}${data?[index].posterPath}"),
                              ),
                              title: Text(
                                '${data?[index].title}',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "${data?[index].releaseDate},",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        161, 255, 255, 255)),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailscreen(
                                      filmm: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Movies"),
    );
  }
}
