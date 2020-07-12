import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/index.dart';
import 'package:social_media_app/screens/login.dart';
import 'package:social_media_app/services/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String instaLogoPath = "asset/images/insta_logo.png";
  FirebaseAuth _authInstance = FirebaseAuth.instance;
  @override
  void initState(){
    print(_authInstance.currentUser());
    super.initState();
    Timer(Duration(seconds: 3), _navigate);
  }

  void _navigate() {
    _authInstance.currentUser != null
        ? Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => MyHomePage()))
        : Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final Size DEVSIZE = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: MAIN_APP_COLOR),
      body: Container(
          color: MAIN_APP_COLOR,
          width: DEVSIZE.width,
          height: DEVSIZE.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Image.asset(instaLogoPath, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("from"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "FELIX",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          )),
    ));
  }

  final Shader linearGradient = LinearGradient(colors: <Color>[
    Color.fromRGBO(250, 143, 34, 1),
    Color.fromRGBO(224, 67, 105, 1),
    Color.fromRGBO(140, 59, 170, 1)
  ]).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 100.0));
}
