import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_2/AdivinaState.dart';
import 'package:provider/provider.dart';

class screen2 extends StatefulWidget {
  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {

  final TextEditingController _controller =
  TextEditingController();

  bool finished = false;

  int tries = 0;

  String random = "daniela";

  String message = "";

  @override
  Widget build(BuildContext context) {
    var gameState = context.watch<AdivinaState>();
    return Scaffold(
      backgroundColor: Color(0xFFFCABC3), // Set the background color here
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Set the padding value here
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset("assets/images/taytay.jpg")),
              TextField(
                enabled: !finished,
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter some text',
                ),
              ),
              SizedBox(height: 20.0), // Add space here
              ElevatedButton(
                  child: Text("PLAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                onPressed: finished ? null : guess,),
              SizedBox(height: 20.0), // Add space here
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Message: ${gameState.message}'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Tries: ${gameState.tries}'),
              ),
            ],
          ),
        ),
      ),
    );

  }


  void guess() {
    var gameState = context.read<AdivinaState>();
    if (_controller.text.isNotEmpty) {
      String guess = _controller.text;
      if (guess == random) {
        gameState.setMessage("$guess is the correct answer!");
        finished = true;
      } else {
        gameState.setMessage("$guess is not the correct answer");
        gameState.incrementTries();
        finished = false;
      }
    }
  }
}
