import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/config/textStyles.dart';
import 'package:social_media_app/index.dart';
import 'package:social_media_app/providers/switchSplashProvider.dart';
import 'package:social_media_app/services/firebase_auth.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailTextEditingController =
      TextEditingController(text: "");
  TextEditingController _passwordTextEditingController =
      TextEditingController(text: "");

  FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  Future _login(BuildContext context) async {
    String email = _emailTextEditingController.text.trim();
    String password = _passwordTextEditingController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      FirebaseUser user = await _firebaseAuthServices.login(email, password);
      return user;
    } else {
      Scaffold.of(context).showSnackBar(_snackBar(Row(
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Email or password field can't be empty"),
          )
        ],
      )));
      return false;
    }
  }

  SnackBar _snackBar(Widget child) =>
      SnackBar(duration: Duration(milliseconds: 500), content: child);

  @override
  Widget build(BuildContext context) {
    SwitchToHomeProvider switchToHomeProvider =
        Provider.of<SwitchToHomeProvider>(context);
    final Size DEVSIZE = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: switchToHomeProvider.getIsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  color: APP_BODY_COLOR,
                  width: DEVSIZE.width,
                  height: DEVSIZE.height * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Instagram Clone",
                          style: instaTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white10,
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _emailTextEditingController,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "email"),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 5),
                                Expanded(
                                  child: TextField(
                                    controller: _passwordTextEditingController,
                                    obscureText: true,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Password"),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {})
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: Builder(
                            builder: (BuildContext ctx) => FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.blue,
                                onPressed: () async {
                                  switchToHomeProvider.setIsLoading = true;
                                  _login(ctx).then((value) {
                                    if (value == false) {
                                      switchToHomeProvider.setIsLoading = false;
                                    } else if (value == null) {
                                      switchToHomeProvider.setIsLoading = false;
                                      Toast.show('Invalid Credentials', context,
                                          backgroundColor: Colors.black,
                                          duration: Toast.LENGTH_SHORT,
                                          gravity: Toast.BOTTOM);
                                    } else {
                                      switchToHomeProvider.setIsLoading = false;
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
                                    }
                                  });
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Forgotten your login details? ",
                                style: TextStyle(color: Colors.black45)),
                            TextSpan(
                                text: "Get help with signing in.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Entypo.facebook_with_circle,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Log In With Facebook",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Divider(color: Colors.grey[900]),
                            )),
                            Text("OR"),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Divider(
                                color: Colors.grey[900],
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: 20),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.grey[600])),
                          TextSpan(
                              text: "Sign Up.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))
                        ])),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Instagram Clone from Felix",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
