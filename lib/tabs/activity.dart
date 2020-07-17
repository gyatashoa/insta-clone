import 'package:flutter/material.dart';
import 'package:social_media_app/config/colors.dart';


class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ActivityScreenAppBar(),
        Container(
          
        ),
      ],
    );
  }
}

class ActivityScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MAIN_APP_COLOR,
      title: Text("Activity"),
    );
  }
}