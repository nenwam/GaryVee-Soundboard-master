// Flutter Imports
import 'dart:ui';
import 'package:flutter/material.dart';

// Package Imports
import 'package:test_soundboard_app/drawer_maker.dart';
import 'package:test_soundboard_app/make_button.dart';

class Responses extends StatefulWidget
{
   Responses({ Key key }) : super(key: key);
   State<StatefulWidget> createState() => new _Responses();

}

class _Responses extends State<Responses>
{
  // Instance Variables
  MediaQueryData queryData;
  final double SWMULTIPLIER = .95;

  // Methods
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Responses', 
          style: new TextStyle(
            fontFamily: 'Permanent Marker', 
            fontSize: 26
              ), 
            ),
        centerTitle: true,
        ),

        //Drawer
        endDrawer: DrawerMaker(),

      body: getLoadedBody()
    );
  }

  @override
  void dispose() {
    super.dispose();
    queryData = MediaQuery.of(context);
  }

  // Builds on screen elements
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
                  width: queryData.size.width * SWMULTIPLIER,
                  child: Column(children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, buttonHeight,'Yes', 'sounds/responses/Yes.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'No', 'sounds/responses/No.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'Welcome', 'sounds/responses/welcome.mp3'),
                    ]),
                    space,
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, buttonHeight, 'You did, \nmy man', 'sounds/responses/you_did.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'Entrepeneurship is cool', 'sounds/responses/entrepeneurshiop_is_cool.mp3'),
                    ]),
                    space,
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, buttonHeight, 'I feel bad', 'sounds/responses/i_feel_bad.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'You\'re not \nhappy', 'sounds/responses/youre_not_happy.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'This is \nreal talk', 'sounds/responses/this_is_real_talk.mp3'),
                    ],),
                    space,
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, buttonHeight, 'I\'m just so tired', 'sounds/responses/im_just_so_tired.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'That\'s exactly right', 'sounds/responses/thats_exactly_right.mp3'),
                    ],),
                    space,
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, 56.0, 'That\'s \nfucking \namazing', 'sounds/responses/thats_fucking_amazing.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'Shit, man', 'sounds/responses/shit_man.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'You guys \nare here?', 'sounds/responses/YouGuysHere.mp3'),
                    ],),
                    space,
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      MakeButton(buttonWidth, buttonHeight, 'You\'re not', 'sounds/responses/YoureNot.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'Listen', 'sounds/responses/Listen.mp3'),
                      MakeButton(buttonWidth, buttonHeight, 'I Don\'t Know', 'sounds/responses/IDontKnow.mp3'),
                    ],),
                  space,
                  ])
                )
              )
              ),
            )
      ]);
  }
}