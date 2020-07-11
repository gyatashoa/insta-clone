import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/providers/tabProvider.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabProvider _tabProvider = Provider.of<TabProvider>(context);
    return BottomNavigationBar(
        onTap: (int tab) {
          _tabProvider.setCurrentIndex = tab;
        },
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        backgroundColor: MAIN_APP_COLOR,
        currentIndex: _tabProvider.currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.heart_o), title: Text("")),
          BottomNavigationBarItem(
              icon: Container(
                height: 24,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _tabProvider.currentIndex == 4
                            ? Colors.black
                            : Colors.black38),
                    shape: BoxShape.circle),
              ),
              title: Text("")),
        ]);
  }
}
