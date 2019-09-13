import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:test_soundboard_app/drawer_maker.dart';
import 'package:test_soundboard_app/soundplayer.dart';
import 'package:test_soundboard_app/soundstorage.dart';
import 'package:test_soundboard_app/make_button.dart';


class Sayings extends StatefulWidget
{
   Sayings({ Key key }) : super(key: key);
   State<StatefulWidget> createState() => new _Sayings();
}

class _Sayings extends State<Sayings>
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
          'Sayings', 
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
                MakeButton(buttonWidth, buttonHeight, 'Early Bird', 'sounds/sayings/early_bird.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'This is Funny', 'sounds/sayings/ThisIsFunnyReal.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Hire Somebody', 'sounds/sayings/HireSomebody.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Players', 'sounds/sayings/Players.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Do Their Thing', 'sounds/sayings/DoTheirThing.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Understand \nThat', 'sounds/sayings/UnderstandThatReal.mp3'),
              ]),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Less Marathons', 'sounds/sayings/LessMarathons.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Less Fortnite', 'sounds/sayings/LessFortnite.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Fishing \nPole', 'sounds/sayings/FishingPole.mp3'),
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Your Dream', 'sounds/sayings/YourDream.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Just Go Do', 'sounds/sayings/JustGoDo.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Other People\'s \n Opinions', 'sounds/sayings/OtherOpinions.mp3')
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'Try Shit', 'sounds/sayings/TryShit.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Try Shit 2', 'sounds/sayings/TryShit2.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'People Decide No', 'sounds/sayings/DecideNo.mp3')
              ],),
              space,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                MakeButton(buttonWidth, buttonHeight, 'I Love Losing', 'sounds/sayings/LoveLosing.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Parent Opinion', 'sounds/sayings/ParentOpinion.mp3'),
                MakeButton(buttonWidth, buttonHeight, 'Friends', 'sounds/sayings/Friends.mp3')
              ],),
            ])
            )
            
          )
          ),
        )
        
        
      ]);
   
    }
}