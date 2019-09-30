
import 'package:flutter/material.dart';

final key = new GlobalKey<_AdCountManager>();

class AdCountManager extends StatefulWidget
{
  AdCountManager({ Key key }) : super(key: key);
  State<StatefulWidget> createState() => new _AdCountManager();
}

class _AdCountManager extends State<AdCountManager>
{
  int mainAdCount;
  int _responsesAdCount = 0;

  int getMainAdCount()
  {
    return mainAdCount;
  }

  int setMainAdCount()
  {
    mainAdCount = mainAdCount + 1;
    print(mainAdCount);
    return mainAdCount;
  }

   void responsesCounter() {
    setState(() {
      _responsesAdCount++;
    });
  }

  int getResponsesCounter() {
    return _responsesAdCount;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}