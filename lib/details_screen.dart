// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/API/films.dart';
import 'package:movies_app/Ticketbooking.dart';
import 'package:movies_app/bottom_navbar.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:movies_app/constants.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key, required this.filmm});
  final Film filmm;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  late bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Ticketbooking()));
            },
            child: CustomOutline(
              strokeWidth: 4,
              radius: 7,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.red.withOpacity(0),
                    Colors.blue.withOpacity(0.1),
                    Colors.blue,
                  ],
                  stops: const [
                    0.2,
                    0.4,
                    0.6,
                    1
                  ]),
              width: screenWidth * 0.5,
              height: 60,
              padding: EdgeInsets.all(6),
              child: Center(
                child: Text(
                  'Start watching',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenHeight),
                    child: Stack(children: [
                      Image.network(
                        // "assets/movie-posters/the-batman-cover.jpeg",
                        "${Constants.imgPath}${widget.filmm.posterPath}",
                        color: Color.fromARGB(200, 198, 198, 198),
                        colorBlendMode: BlendMode.modulate,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          height: 180,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(0, 0, 0, 0),
                                  Color.fromARGB(255, 0, 0, 0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0, 0.95]),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  // child: Image.asset(
                  //   "assets/movie-posters/the-batman-cover.jpeg",
                  // ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        widget.filmm.title,
                        // filmm.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Release date • ${widget.filmm.releaseDate}",
                        style: TextStyle(
                            color: Color.fromARGB(184, 205, 205, 205),
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // color: const Color.fromARGB(143, 255, 193, 7),
                        height: 25,
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                ignoreGestures: true,
                                itemCount: 1,
                                itemSize: 20,
                                unratedColor: Colors.white,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                                onRatingUpdate: (rating) {}),
                            Text(
                              "${widget.filmm.voteAverage.toString()}/10",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontSize: 18.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.filmm.overview,
                          maxLines: isShowMore ? 4 : null,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              height: 2),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isShowMore = !isShowMore;
                          });
                        },
                        child: Text(
                          isShowMore ? "Show more" : "Show less",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              color: Colors.white,
              iconSize: 30,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bottomnavbar(),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}






// Scaffold(
//       body: SafeArea(
//         child: Stack(
          
//           children: [
//             Positioned(
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 color: Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               child: Image.network(
//                 "assets/movie-posters/the-batman-cover.jpeg",
//                 // "${Constants.imgPath}${filmm.backDropPath}",
//                 height: screenHeight * 0.5,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: screenHeight * 0.05,
//               left: screenWidth * 0.05,
//               child: IconButton(
//                 color: Colors.white,
//                 iconSize: 30,
//                 icon: Icon(Icons.arrow_back_ios),
//                 onPressed: () {},
//               ),
//             ),
//             Positioned.fill(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [
//                         Colors.transparent,
//                         Color.fromARGB(255, 0, 0, 0)
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       stops: [0.05, 0.5]),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: screenHeight * 0.45,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     width: double.infinity,
//                     child: Column(
//                       children: [
//                         Text(
//                           "The batman",
//                           // filmm.title,
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold),
//                         ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Action • Superhero • Drama • 2022",
                        //   style: TextStyle(
                        //       color: Color.fromARGB(184, 205, 205, 205),
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.w300),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // RatingBar.builder(
                        //     initialRating: 4,
                        //     minRating: 1,
                        //     direction: Axis.horizontal,
                        //     allowHalfRating: true,
                        //     ignoreGestures: true,
                        //     itemCount: 5,
                        //     itemSize: 20,
                        //     unratedColor: Colors.white,
                        //     itemPadding: EdgeInsets.symmetric(horizontal: 5),
                        //     itemBuilder: (context, index) {
                        //       return const Icon(
                        //         Icons.star,
                        //         color: Colors.amber,
                        //       );
                        //     },
                        //     onRatingUpdate: (rating) {}),
//                         SizedBox(
//                           height: 10,
//                         ),
                        // Text(
                        //   "The film sees Batman, who has been fighting crime in Gotham City for two years, uncover corruption while pursuing the Riddler (Dano), a serial killer who targets Gotham's corrupt elite.",
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //       letterSpacing: 0.5,
                        //       height: 2),
                        // ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.2,
//             ),
            // Positioned(
            //     width: screenWidth,
            //     bottom: screenHeight * 0.04,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                      // CustomOutline(
                      //   strokeWidth: 4,
                      //   radius: 7,
                      //   gradient: LinearGradient(
                      //       begin: Alignment.topLeft,
                      //       end: Alignment.bottomRight,
                      //       colors: [
                      //         Colors.red,
                      //         Colors.red.withOpacity(0),
                      //         Colors.blue.withOpacity(0.1),
                      //         Colors.blue,
                      //       ],
                      //       stops: const [
                      //         0.2,
                      //         0.4,
                      //         0.6,
                      //         1
                      //       ]),
                      //   width: screenWidth * 0.42,
                      //   height: 60,
                      //   padding: EdgeInsets.all(6),
                      //   child: Center(
                      //     child: Text(
                      //       'Add to watch list',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 17,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                  //     CustomOutline(
                  //       strokeWidth: 4,
                  //       radius: 7,
                  //       gradient: LinearGradient(
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight,
                  //           colors: [
                  //             Colors.blue,
                  //             Colors.blue.withOpacity(0),
                  //             Colors.red.withOpacity(0.1),
                  //             Colors.red,
                  //           ],
                  //           stops: const [
                  //             0.2,
                  //             0.4,
                  //             0.6,
                  //             1
                  //           ]),
                  //       width: screenWidth * 0.42,
                  //       height: 60,
                  //       padding: EdgeInsets.all(6),
                  //       child: Center(
                  //         child: Text(
                  //           'Start watching',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 17,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
//                 )),
//           ],
//         ),
//       ),
//     );

































