import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/colors.dart';
import 'package:social_media_app/screens/profileDetails.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _query = TextEditingController();

  QuerySnapshot _snap;

  void _search() async {
    _snap = await store
        .collection("userProfile")
        .where("username", isEqualTo: _query.text)
        .getDocuments();
    setState(() {});
  }

  Firestore store = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchScreenAppBar(
          search: _search,
          controller: _query,
        ),
        _snap != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _snap.documents.length,
                itemBuilder: (context, i) => ListTile(
                      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context)=>ProfileDetail(data: _snap.documents[i].data,))),
                      title: Text(_snap.documents[i].data["name"]),
                      subtitle: Text(_snap.documents[i].data["username"]),
                    ))
            : SizedBox()
      ],
    );
  }
}

class SearchScreenAppBar extends StatelessWidget {
  Function search;
  final TextEditingController controller;
  SearchScreenAppBar({this.controller, this.search});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MAIN_APP_COLOR,
      elevation: 2,
      title: Container(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration.collapsed(hintText: "Search"),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: search,
            )
          ],
        ),
      ),
    );
  }
}
