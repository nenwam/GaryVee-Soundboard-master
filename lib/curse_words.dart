import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:test_soundboard_app/drawer_maker.dart';
import 'package:test_soundboard_app/soundplayer.dart';
import 'package:test_soundboard_app/soundstorage.dart';
import 'package:test_soundboard_app/make_button.dart';

class CurseWords extends StatefulWidget
{
   CurseWords({ Key key }) : super(key: key);
   State<StatefulWidget> createState() => new _CurseWords();
}

class _CurseWords extends State<CurseWords>
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
          'Curse Words', 
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
                MakeButton(buttonWidth, buttonHeight, 'Give a Fuck', 'sounds/curse/IDontGiveAFuck.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fuck the Man', 'sounds/curse/FuckTheMan.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fucken', 'sounds/curse/Fucken.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'The Fuck \nYou Think', 'sounds/curse/TheFuckYouThink.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Ain\'t Shit', 'sounds/curse/AintShit.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Crazy Shit', 'sounds/curse/CrazyShit.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Fucked Up', 'sounds/curse/FuckedUpReal.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Shit', 'sounds/curse/Shit.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fucken Suck', 'sounds/curse/FuckenSuck.mp3'),
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Fucken Trash', 'sounds/curse/FuckenTrash.mp3'),
                MakeButton(buttonWidth, 56.0, 'Shit on You', 'sounds/curse/ShitOnYou.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fuck Faces', 'sounds/curse/FuckFaces.mp3')
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'I Love Curse', 'sounds/misc/ILoveCurse.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Dick Face', 'sounds/curse/DickFace.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Nobody Gives \n a Fuck', 'sounds/curse/NobodyGivesAFuck.mp3')
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Jack Shit', 'sounds/curse/JackShit.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'You\'re Lost', 'sounds/curse/YoureLost.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Done Shit', 'sounds/curse/DoneShit.mp3')
              ],),
            ])
            )
            
          )
          ),
        )
        
        
      ]);
   
    }
}