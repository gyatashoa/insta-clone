import 'package:flutter/material.dart';
import 'package:social_media_app/config/colors.dart';

class ProfileScreen extends StatelessWidget {
  String _name = "MR LORD AMOAKO";
  String accountType = "Personal Blog";
  String bio = "Fuck class we all clay!";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    _buildUserParticulars("Posts", 0),
                    _buildUserParticulars("Followers", 5998),
                    _buildUserParticulars("Following", 90)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  accountType,
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
                Text(
                  bio,
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
  String userName = "Christian_todd";
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MAIN_APP_COLOR,
      title: Text(userName),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
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
