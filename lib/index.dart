import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/config/appInfo.dart';
import 'package:social_media_app/providers/tabProvider.dart';
import 'package:social_media_app/tabs/activity.dart';
import 'package:social_media_app/tabs/home.dart';
import 'package:social_media_app/tabs/post.dart';
import 'package:social_media_app/tabs/profile.dart';
import 'package:social_media_app/tabs/search.dart';
import 'package:social_media_app/widgets/bottomNavigation.dart';

class MyHomePage extends StatelessWidget {
  final FirebaseUser user;
  // FirebaseUser getCurrentUser()
  final List<Widget> _tabs = [
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    ActivityScreen(),
    ProfileScreen()
  ];
  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabProvider _tabProvider = Provider.of<TabProvider>(context);
    return Scaffold(
        // appBar: appBars[_tabProvider.currentIndex],
        body: _tabs[_tabProvider.currentIndex],
        bottomNavigationBar: BottomNav());
  }
}
