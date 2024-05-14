import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'TayState.dart';

class screen4 extends StatefulWidget {
  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {

  @override
  Widget build(BuildContext context) {
    var tayState = context.watch<TayState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(tayState.titulo ?? ''),
      ),
      body: Text('Autores: ${tayState.autores?.join(', ') ?? ''}\nDuración: ${tayState.duracion ?? ''}'),
    );
  }

}