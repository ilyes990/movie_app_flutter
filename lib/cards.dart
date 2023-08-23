// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/details_screen.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      filmm: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: Container(
                  height: 180,
                  width: 150,
                  padding: EdgeInsets.only(left: 13),
                  margin: index == 0
                      ? EdgeInsets.only(left: 0)
                      : EdgeInsets.only(left: 0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        "${Constants.imgPath}${snapshot.data[index].posterPath}"),
                  )),
            );
          }),
    );
  }
}
