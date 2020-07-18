import 'package:flutter/material.dart';
import 'package:social_media_app/model/userInfo.dart';
import 'package:social_media_app/tabs/profile.dart';

class ProfileDetail extends StatelessWidget {
  var data;
  ProfileDetail({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileScreen().buildUI(UserProfile.fromMap(data),isOtherProfile:true));
  }
}
