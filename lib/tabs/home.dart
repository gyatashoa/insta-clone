import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_media_app/config/appInfo.dart';
import 'package:social_media_app/config/colors.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeScreenAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StatusSection(),
                Divider(
                  thickness: 1.5,
                  color: Colors.black.withOpacity(0.1),
                ),
                Column(
                  children: <Widget>[PostCard(), PostCard()],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  @override
  build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: Icon(SimpleLineIcons.camera), onPressed: () {}),
      backgroundColor: MAIN_APP_COLOR,
      title: Text(AppInfo.APP_NAME),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Transform.rotate(
              origin: Offset(0, 0),
              angle: -math.pi / 6,
              child: Icon(Icons.send)),
        )
      ],
    );
  }
}

class StatusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) =>
            Status(currentIndex: index),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final int currentIndex;
  Status({Key key, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return currentIndex == 0
        ? InkWell(onTap: () {}, child: buildUserStory())
        : InkWell(onTap: () {}, child: buildOtherStory());
  }

  Widget buildOtherStory() {
    String person = "1realJoeyB";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                shape: BoxShape.circle),
            child: Container(),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            person,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }

  Widget buildUserStory() {
    String user = "christian_todd";
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 70,
              width: 70,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
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
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            user,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String time = "15 hours ago";
    int commentNumber = 40;
    String user = "cristiano";
    String postMessage = "Feels good to be back!!!";
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(user),
                  ],
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ],
            )),
          ),
          Container(
            height: 350,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(FontAwesome.heart_o), onPressed: () {}),
                  IconButton(
                      icon: Icon(FontAwesome.comment_o), onPressed: () {}),
                  Transform.rotate(
                      angle: -pi / 6,
                      child:
                          IconButton(icon: Icon(Icons.send), onPressed: () {}))
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  ),
                  onPressed: () {})
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "$user \t",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                      text: postMessage, style: TextStyle(color: Colors.black)),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: InkWell(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("view all ${commentNumber.toString()} comments \n",
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(time,
                  style: TextStyle(color: Colors.black54, fontSize: 14)),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
