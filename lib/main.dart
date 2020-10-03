import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'exercises/exe_1001.dart';
import 'exercises/exe_1009.dart';
import 'exercises/exe_2344.dart';
import 'exercises/exe_1018.dart';
import 'exercises/exe_3040.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          height: 100,
          minWidth: 100,
        ),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
);

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Uri Judge Online"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    RaisedButton _1001 = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exe_1001()
          ),
        );
      },
      child: Text(
        "1001",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
      ),
      color: Colors.blueAccent,
    );

    RaisedButton _1009 = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exe_1009()
          ),
        );
      },
      child: Text(
        "1009",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
      ),
      color: Colors.blueAccent,
    );

    RaisedButton _1018 = RaisedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exe_1018()
          ),
        );
      },
      child: Text(
        "1018",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
      ),
      color: Colors.blueAccent,
    );

    RaisedButton _2344 = RaisedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exe_2344()
          ),
        );
      },
      child: Text(
        "2344",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
      ),
      color: Colors.blueAccent,
    );

    RaisedButton _3040 = RaisedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exe_3040()
          ),
        );
      },
      child: Text(
        "3040",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
      ),
      color: Colors.blueAccent,
    );

    Column column_left = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _1001,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _2344,
        ),
      ],
    );

    Column column_center = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _1009,
        ),
      ],
    );

    Column column_right = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _1018,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _3040,
        ),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: column_left,
            ),
            Expanded(
              child: column_center,
            ),
            Expanded(
              child: column_right,
            ),
          ],
        ),
      ),
    );

    return scaffold;

  }
}
