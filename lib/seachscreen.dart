// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, unused_local_variable

import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:movies_app/API/api.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API/films.dart';
import 'package:movies_app/search.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController _searchController = TextEditingController();
  // late final AsyncSnapshot snapshot;
  late List<Film> filteredMovies;
  Api _filmList = Api();
  late Film filmm;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        // ));
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersive,
        );
      },
      child: Scaffold(
        body: Stack(children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Search",
                  style: TextStyle(color: Color.fromARGB(178, 255, 255, 255)),
                ),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: SearchMovie());
                      },
                      icon: Icon(Icons.search))
                ]),
            backgroundColor: Colors.transparent,
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/Background/Movie_background_FIGMA.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                          future: _filmList.searchpopularmovies(),
                          builder: (context, snapshot) {
                            var data = snapshot.data;
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return ListTile(
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
                                  );
                                });
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
