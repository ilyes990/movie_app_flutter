// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:movies_app/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/Background/Movie_background_FIGMA_Welcomepage.jpg"),
                  fit: BoxFit.cover)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                // Text(
                //   "CineView",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w300,
                //       letterSpacing: 2,
                //       fontSize: 40),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Text(
                  "Welcome Cinephiles",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Step into a world of cinematic wonders.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(119, 0, 0, 0),
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Log in to unlock your movie journey",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        style: TextStyle(
                            color: Color.fromARGB(214, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(139, 255, 255, 255))),
                            hintText: "email",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(146, 255, 255, 255)),
                            labelText: "Enter your email",
                            labelStyle: TextStyle(
                                color:
                                    const Color.fromARGB(149, 255, 255, 255))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                            color: Color.fromARGB(139, 255, 255, 255)),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(139, 255, 255, 255))),
                          hintText: "Passwod",
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(149, 255, 255, 255)),
                          labelText: "Enter your Passwod",
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(149, 255, 255, 255)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Forgot password ?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: CustomOutline(
                          strokeWidth: 4,
                          radius: 30,
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
                          width: double.infinity,
                          height: 65,
                          padding: EdgeInsets.all(6),
                          child: Center(
                            child: Text(
                              'LOGIN',
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
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.white,
                            height: 36,
                          )),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: const Color.fromARGB(152, 255, 255, 255),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.white,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterSocialButton(
                            onTap: () {},
                            mini: true,
                            buttonType: ButtonType.google,
                          ),
                          FlutterSocialButton(
                            onTap: () {},
                            mini: true,
                            buttonType: ButtonType.facebook,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "You don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
