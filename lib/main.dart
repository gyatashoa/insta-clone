import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/index.dart';
import 'package:social_media_app/providers/profile_provider.dart';
import 'package:social_media_app/providers/switchSplashProvider.dart';
import 'package:social_media_app/providers/tabProvider.dart';
import 'package:social_media_app/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SwitchToHomeProvider()),
        ChangeNotifierProvider(create: (context) => TabProvider())
      ],
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Social Media',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
