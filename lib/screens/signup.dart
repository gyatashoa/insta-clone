import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/databases/tempData.dart';
import 'package:social_media_app/index.dart';
import 'package:social_media_app/screens/login.dart';
import 'package:social_media_app/services/firebase_auth.dart';
import 'package:toast/toast.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  void _signUp(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseAuthServices services = FirebaseAuthServices();

      FirebaseUser user =
          await services.signUp(email: _email.text, password: _pass.text);
      if (user != null) {
        Firestore store = Firestore.instance;
        await store.collection("userProfile").document(user.uid).setData({
          "username": "${_username.text}",
          "followers": 0,
          "following": 0,
          "post": 0,
          "name": "${_name.text}",
          "accountType": "",
          "bio": ""
        });
        await TempData().getUser();
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => MyHomePage()));
        return;
      }
      Toast.show("Error creating user", context);
      return;
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 500),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text("Please fill out the form"),
        ],
      ),
    ));
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size DEVSIZE = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Container(
                    height: DEVSIZE.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _name,
                              validator: (value) {
                                if (value.trim().length < 5) {
                                  return "field can't be lesser than 5";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration:
                                  InputDecoration(hintText: "Full Name"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _username,
                              validator: (value) {
                                if (value.trim().length < 5) {
                                  return "field can't be lesser than 5";
                                } else if (value.contains(" ")) {
                                  return "field can't contain spaces";
                                }

                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(hintText: "Username"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _email,
                              validator: (value) {
                                if (!EmailValidator.validate(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(hintText: "Email"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _pass,
                              validator: (value) {
                                if (value.trim().length < 6) {
                                  return "length of password shouldn't be less then 6";
                                } else if (value.contains(" ")) {
                                  return "password can't contain spaces";
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(hintText: "Password"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (!(value == _pass.text)) {
                                  return "both password fields should be the same";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              decoration:
                                  InputDecoration(hintText: "Confirm Password"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Builder(
                          builder: (context) => Container(
                            width: DEVSIZE.width,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () => _signUp(context),
                              color: Colors.blue,
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginPage())),
                          child: RichText(
                              text: TextSpan(
                                  text: "Already have a account?\t\t",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]),
                                  children: [
                                TextSpan(
                                    text: "Sign in",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                              ])),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
