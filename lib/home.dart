// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/API/api.dart';
import 'package:movies_app/cards.dart';

import 'API/films.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Film>> playingNowMovies;
  late Future<List<Film>> uupcomingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playingNowMovies = Api().getnowPlayingFilms();
    uupcomingMovies = Api().getUpcomingFilms();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/Background/Movie_background_FIGMA.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                // Positioned(
                //   top: 30,
                //   left: 30,
                //   child: Container(
                //     height: 166,
                //     width: 166,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Color.fromARGB(255, 15, 75, 255)),
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(
                //         sigmaX: 0,
                //         sigmaY: 0,
                //       ),
                //       child: Container(
                //         height: 166,
                //         width: 166,
                //         color: Color.fromARGB(0, 0, 0, 0),
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   bottom: 150,
                //   right: 10,
                //   child: Container(
                //     height: 166,
                //     width: 166,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Color.fromARGB(255, 0, 119, 255)),
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(
                //         sigmaX: 150,
                //         sigmaY: 150,
                //       ),
                //       child: Container(
                //         height: 166,
                //         width: 166,
                //         color: Colors.transparent,
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   bottom: 10,
                //   left: 8,
                //   child: Container(
                //     height: 166,
                //     width: 166,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Color.fromARGB(255, 255, 0, 0)),
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(
                //         sigmaX: 160,
                //         sigmaY: 160,
                //       ),
                //       child: Container(
                //         height: 166,
                //         width: 166,
                //         color: Color.fromARGB(0, 0, 0, 0),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "What would you\nlike to watch",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          "New movies",
                          style: TextStyle(
                              color: Color.fromARGB(194, 206, 206, 206),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 180,
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return Cards(snapshot: snapshot);
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          future: playingNowMovies,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          "Upcoming movies",
                          style: TextStyle(
                              color: Color.fromARGB(194, 206, 206, 206),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 180,
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return Cards(snapshot: snapshot);
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          future: uupcomingMovies,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  // GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => Searchscreen(),
  //                         ),
  //                       );
  //                     },
  //                     child: SearchBar(
  //                       padding: MaterialStateProperty.all(
  //                           EdgeInsets.fromLTRB(12, 0, 20, 0)),
  //                       hintText: 'Search',
  //                       hintStyle: MaterialStateProperty.all(
  //                           const TextStyle(color: Colors.grey, fontSize: 18)),
  //                       constraints: const BoxConstraints(
  //                         maxWidth: 350,
  //                         maxHeight: 50,
  //                       ),
  //                       backgroundColor: MaterialStatePropertyAll(
  //                           Color.fromARGB(21, 152, 151, 151)),
  //                       leading: Icon(
  //                         Icons.search,
  //                         color: Color.fromARGB(255, 150, 150, 150),
  //                       ),
  //                       trailing: [
  //                         Icon(
  //                           Icons.keyboard_voice,
  //                           color: Color.fromARGB(255, 139, 139, 139),
  //                         ),
  //                       ],
  //                     ),
  //                   ),


                      // TypeAheadFormField(
                    //   textFieldConfiguration: TextFieldConfiguration(
                    //     controller: this._searchController,
                    //     decoration: InputDecoration(
                    //       hintText: "Search",
                    //       prefixIcon: Icon(Icons.search),
                    //       border: InputBorder.none
                    //     )
                    //   ),
                    //   itemBuilder: (BuildContext context, itemData) {},
                    //   suggestionsCallback: (String pattern) {

                    //   },
                    //   onSuggestionSelected: (Object? suggestion) {},
                    // ),