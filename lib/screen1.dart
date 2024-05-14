import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_2/AdivinaState.dart';
import 'package:provider/provider.dart';

class screen1 extends StatefulWidget {
  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You've pressed the button",
                style: TextStyle(
                  backgroundColor: Colors.purple,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$counter veces"),
              ElevatedButton(child: Text("PLAY"), onPressed: goToScreen2),
              ElevatedButton(child: Text("SEE TAYTAY CONTENT"), onPressed: goToScreen3)
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            child: Text("+"),
            onPressed: increase,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            child: Text("-"),
            onPressed: decrease,
          )
        ]);
  }

  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  void goToScreen2(){
    setState(() {
      Navigator.of(context).pushNamed('/screen2');
    });
  }

  void goToScreen3(){
    setState(() {
      Navigator.of(context).pushNamed('/screen3');
    });
  }
}
