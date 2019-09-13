import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:test_soundboard_app/drawer_maker.dart';
import 'package:test_soundboard_app/soundplayer.dart';
import 'package:test_soundboard_app/soundstorage.dart';
import 'package:test_soundboard_app/make_button.dart';


class Funny extends StatefulWidget
{
   Funny({ Key key }) : super(key: key);
   State<StatefulWidget> createState() => new _Funny();
}

class _Funny extends State<Funny>
{

  MediaQueryData queryData;

  SoundPlayer player;

  List<String> soundFilePath;

  @override
  void initState() {
    super.initState();
    player = new SoundPlayer();
  }



  Widget getFuture(){
    return new FutureBuilder<List<String>>(
      future: new SoundStorage().loadSounds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Awaiting result...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else{
              soundFilePath = snapshot.requireData;
              print('Loading completed. ${soundFilePath.length} sounds loaded');
              return getLoadedBody();
            }
        }

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Funny', 
          style: new TextStyle(
            fontFamily: 'Permanent Marker', 
            fontSize: 26
              ), 
            ),
        centerTitle: true,
        ),

        //Drawer
        endDrawer: DrawerMaker(),

      body: getFuture()
    );
  }

  @override
  void dispose() {
    super.dispose();
    queryData = MediaQuery.of(context);
    player.dispose();
  }

  Widget getLoadedBody(){

    final space = Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0));
    final double buttonWidth = 100;
    final double buttonHeight = 50;

    return new  Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/garyVeeTestBG1.png'),
                  fit: BoxFit.cover,
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
        SingleChildScrollView(
          child: Center(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Container(
              width: queryData.size.width,
              child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Turns Me On', 'sounds/misc/really_turns_me_on.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Dickpants47', 'sounds/misc/dick_pants_47.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Juice From \n the Moon', 'sounds/misc/juice_from_moon.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Piano On Face', 'sounds/misc/piano_on_face.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'She\'s a Gangster', 'sounds/misc/ShesAGangster.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Hello Hong Kong', 'sounds/misc/HelloHongKong.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Lunch Room Shit', 'sounds/misc/LunchRoomShit.mp3'),
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Hotdogs', 'sounds/misc/Hotdogs.mp3'),
                MakeButton(buttonWidth, buttonHeight, '21 Savage', 'sounds/misc/21Savage.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'The World', 'sounds/misc/TheWorld.mp3')
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Fatpants86', 'sounds/misc/Fatpants86.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Food Taste', 'sounds/misc/FoodTaste.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Blueberries', 'sounds/misc/Blueberries.mp3'),
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Blueberries 2', 'sounds/misc/Blueberries2.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fuck You \n Grandpa', 'sounds/misc/FuckYouGrandpa.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Hand Eye', 'sounds/misc/HandEye.mp3')
              ],),
            ])
            )
            
          )
          ),
        )
        
        
      ]);
   
    }
}