// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:movies_app/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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
        // backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/Background/Movie_background_FIGMA_Welcomepage.jpg"),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              SafeArea(
                  child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Text(
                    //   "CineView",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: const Color.fromARGB(162, 255, 255, 255),
                    //       fontWeight: FontWeight.w500,
                    //       letterSpacing: 2,
                    //       fontSize: 40),
                    // ),
                    SizedBox(
                      height: 45,
                    ),
                    CustomOutline(
                        strokeWidth: 4,
                        radius: 120,
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
                        width: 250,
                        height: 250,
                        padding: EdgeInsets.all(6),
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/onboarding_watchingmovies.png"))),
                        )),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Watch movies in\nvirtual reality",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 33),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Download and watch movies\nwherever you are",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: CustomOutline(
                        strokeWidth: 4,
                        radius: 120,
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
                        width: 160,
                        height: 60,
                        padding: EdgeInsets.all(6),
                        child: Center(
                          child: Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
