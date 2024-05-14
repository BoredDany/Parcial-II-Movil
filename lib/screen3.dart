import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project_2/TayState.dart';


class screen3 extends StatefulWidget {
  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  final String title= "TAYTAY";
  Future<List<dynamic>> futureSongs = loadSongs();

  @override
  Widget build(BuildContext context) {
    var tayState = context.watch<TayState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('TAYTAY'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureSongs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['titulo']),
                  subtitle: Text('Autores: ${snapshot.data?[index]['autores'].join(', ')}\nDuración: ${snapshot.data?[index]['duracion']}'),
                  onTap: () {
                    List<String> autores = List<String>.from(snapshot.data?[index]['autores'] ?? []);
                    tayState.setSongData(snapshot.data?[index]['titulo'], autores, snapshot.data?[index]['duracion']);
                    Navigator.of(context).pushNamed('/screen4');
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> loadSongs() async {
  String jsonString = await rootBundle.loadString('assets/files/tay.json');
  return jsonDecode(jsonString);
}