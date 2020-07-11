import 'package:flutter/material.dart';
import 'package:social_media_app/config/colors.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MAIN_APP_COLOR,
      elevation: 2,
      title: Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(width: 10,),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Search"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
