import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:test_soundboard_app/soundstorage.dart';

class MakeButton extends StatelessWidget
{
  AudioCache audio;

  MediaQueryData queryData;

  double buttonWidth;
  double buttonHeight;
  String name;
  String filePath;
  

  MakeButton(double buttonWidth, double buttonHeight, String name, String filePath)
  {
    audio = new AudioCache();
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.name = name;
    this.filePath = filePath;
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    // TODO: implement build
    return ButtonTheme(
      minWidth: buttonWidth,
      height: buttonHeight,
      padding: new EdgeInsets.all(10),
      child: new RaisedButton(
        onPressed: () => audio.play(filePath),
        child: Text(name, style: new TextStyle(fontFamily: 'Comfortaa Regular', fontSize: queryData.textScaleFactor*14))
      )
    );
  }

  
}