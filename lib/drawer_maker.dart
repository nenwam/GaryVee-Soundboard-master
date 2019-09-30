// Flutter Imports
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_soundboard_app/main.dart';

class DrawerMaker extends StatefulWidget
{
  DrawerMaker({ Key key }) : super(key: key);
  State<StatefulWidget> createState() => new _DrawerMaker();
}



class _DrawerMaker extends State<DrawerMaker>
{
  // Instance Variables
  HomePage main = new HomePage();
  SoundBoardApp home = new SoundBoardApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                onTap: () { 
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/a");
                },
                title: new Text(
                  'Home Page',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 36,
                  )
                ),
              ),
              new Divider(),
              new ListTile(
                onTap: () { 
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/b"); 
                },
                title: new Text(
                  'Responses',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontFamily: 'Comfortaa Bold',
                    fontSize: 30,
                  )
                ),
              ),
              new Divider(),
              new ListTile(
                onTap: () { 
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/c");
                  //TODO: Add route for this page
                },
                title: new Text(
                  'Curse Words',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontFamily: 'Comfortaa Bold',
                    fontSize: 30,
                  )
                )
              ),
              new Divider(),
              new ListTile(
                onTap: () {
                  Navigator.of(context).pop(); 
                  Navigator.of(context).pushReplacementNamed("/d");
                  //TODO: Add route for this page
                },
                title: new Text(
                  'Funny',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontFamily: 'Comfortaa Bold',
                    fontSize: 30,
                  )
                )
              ),
              new Divider(),
              new ListTile(
                onTap: () { 
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/e");
                  //TODO: Add route for this page
                },
                title: new Text(
                  'Sayings',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontFamily: 'Comfortaa Bold',
                    fontSize: 30,
                  )
                )
              )
            ],
          )
        );
  }
}