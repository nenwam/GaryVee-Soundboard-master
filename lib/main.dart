// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

// Plugin Imports
import 'package:firebase_admob/firebase_admob.dart';
import 'package:test_soundboard_app/ad_count_manager.dart';

// Package Imports
import 'package:test_soundboard_app/drawer_maker.dart';
import 'package:test_soundboard_app/responses.dart';
import 'package:test_soundboard_app/curse_words.dart';
import 'package:test_soundboard_app/funny.dart';
import 'package:test_soundboard_app/sayings.dart';



void main() async{
  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(SoundBoardApp());
} 

class SoundBoardApp extends StatelessWidget
{
  final String version = '';
  final String appBarTitle = 'Categories';
  final String responses = 'Responses';
  final String curseWords = 'Curse Words';
  

  

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-4811755606104656~5047317200").then((response){
      myBottomBanner..load()..show();
      myVideoAd..load()..show();
    });
    return MaterialApp(
      title: 'GaryVee Soundboard',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => new SoundBoardApp(),
        "/b": (BuildContext context) => new Responses(),
        "/c": (BuildContext context) => new CurseWords(),
        "/d": (BuildContext context) => new Funny(),
        "/e": (BuildContext context) => new Sayings(),
      }
    );
  }
}

class HomePage extends StatelessWidget
{
  SoundBoardApp main = new SoundBoardApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      
        //AppBar
        appBar: new AppBar(
          title: new Text('Categories', style:TextStyle(fontSize: 26, fontFamily: 'Permanent Marker')),
          centerTitle: true,
          backgroundColor: Colors.yellow,
          elevation: 0.0,
        ),

        //Drawer
        endDrawer: DrawerMaker(),

        //Body
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/garyVeeTestBG1.png'),
                  fit: BoxFit.cover
                )
              ),
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.black.withOpacity(0.2)
                  ),
                )
              )
            ),

            new Center(
            child: new Container(
              color: Colors.yellow,
              height: 370,
              width: 330,
              child: new Column(
                children: <Widget>[
                  new Text(''),
                  new Text(''),
                  new Text(
                    'Welcome to',
                    style: new TextStyle(
                      fontFamily: 'Comfortaa Bold',
                      fontSize: 45
                    )
                  ),
                  new Text(''),
                  new Text(
                    'the',
                    style: new TextStyle(
                      fontFamily: 'Comfortaa Bold',
                      fontSize: 35
                    )
                  ),
                  new Text(
                    'GaryVee',
                    style: new TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 70
                    )
                  ),
                  new Text(''),
                  new Text(''),
                  new Text(
                    'Soundboard',
                    style: new TextStyle(
                      fontFamily: 'Comfortaa Bold',
                      fontSize: 45
                    )
                  ),
                  new Text(''),
                  new Text(
                    main.version,
                    textAlign: TextAlign.end,
                    style: new TextStyle(
                      fontFamily: 'Comfortaa Light',
                      fontSize: 16
                    )
                  )
                ],
              )
          )
        ),
      ]    
      )
    );
  }
}

// Google AdMob
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['garyvee', 'gary vaynerchuck', 'entrepeneurship', 'money', 'hustle', 'sneakers', 
                     'drock', 'business', 'motivational', 'motivation', 'inspirational', 'inspiration'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBottomBanner = BannerAd(
  adUnitId: "ca-app-pub-4811755606104656/8547578516",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myVideoAd = InterstitialAd(
  adUnitId: "ca-app-pub-4811755606104656/9034942250",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
