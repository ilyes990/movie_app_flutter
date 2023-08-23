// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/Onboarding.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/seachscreen.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int index = 0;
  final screens = [
    Home(),
    Onboarding(),
    Searchscreen(),
  ];
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
        backgroundColor: Colors.transparent,
        body: screens[index],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GNav(
                onTabChange: (value) {
                  setState(() {
                    index = value;
                  });
                },
                selectedIndex: index,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Color.fromARGB(121, 17, 0, 143),
                gap: 8,
                padding: EdgeInsets.all(20),
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: ("Home"),
                  ),
                  GButton(
                    icon: Icons.person_2_outlined,
                    text: ("Home"),
                  ),
                  GButton(
                    icon: Icons.search_outlined,
                    text: ("Search"),
                  ),
                  GButton(
                    icon: Icons.home,
                    text: ("Home"),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
