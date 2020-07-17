import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/databases/cloud_firestore_services.dart';
import 'package:social_media_app/databases/tempData.dart';
import 'package:social_media_app/index.dart';
import 'package:social_media_app/model/userInfo.dart';
import 'package:social_media_app/providers/profile_provider.dart';
import 'package:social_media_app/screens/login.dart';
import 'package:social_media_app/screens/splash.dart';
import 'package:social_media_app/services/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  String accountType = "Personal Blog";

  String bio = "Fuck class we all clay!";

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _firestore
            .collection('userProfile')
            .document(TempData.firebaseUser.uid)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            print("null");
          }
          if (snapshot.hasData) {
            return _buildUI(UserProfile.fromMap(snapshot.data.data));
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildUI(UserProfile userProfile) {
    // print(userProfile.name);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfileScreenAppBar(username: userProfile.username),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildUserStory(),
                    _buildUserParticulars("Posts", userProfile.post),
                    _buildUserParticulars("Followers", userProfile.followers),
                    _buildUserParticulars("Following", userProfile.following)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  userProfile.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userProfile.accountType,
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
                Text(
                  userProfile.bio,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildRoudedButton("Edit Profile", () {}),
                    _buildRoudedButton("Promotions", () {}),
                    _buildRoudedButton("Contact", () {})
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.black54),
          LowerTabs()
        ],
      ),
    );
  }

  Widget _buildRoudedButton(String title, Function onPressed) {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget _buildUserParticulars(String title, int value) {
    return Column(
      children: <Widget>[
        Text(
          value.toString(),
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }

  Widget _buildUserStory() {
    String user = "christian_todd";
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ))),
            )
          ],
        ));
  }
}

class ProfileScreenAppBar extends StatelessWidget {
  ProfileScreenAppBar({this.username});
  final String username;
  void _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are your sure you want to log out?"),
        actions: <Widget>[
          FlatButton(
              onPressed: () async {
                await FirebaseAuthServices().logout().then((value) {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => LoginPage()));
                });
              },
              child: Text("Yes")),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MAIN_APP_COLOR,
      title: Text(username),
      actions: <Widget>[
        IconButton(
          onPressed: () => _onPressed(context),
          icon: Icon(Icons.adjust),
        )
      ],
    );
  }
}

class LowerTabs extends StatefulWidget {
  @override
  _LowerTabsState createState() => _LowerTabsState();
}

class _LowerTabsState extends State<LowerTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.grid_on),
    ),
    Tab(
        icon: Icon(
      Icons.picture_in_picture,
    ))
  ];

  List<Widget> _tabView = [Container(), Container()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: _tabs,
          ),
          // Expanded(child: TabBarView(controller: _tabController, children: _tabView))
          // Container()
        ],
      ),
    );
  }

  Widget _buildImageFrames() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
