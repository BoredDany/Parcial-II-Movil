import 'package:flutter/material.dart';
import 'package:flutter_project_2/screen1.dart';
import 'package:flutter_project_2/screen2.dart';
import 'package:flutter_project_2/screen3.dart';
import 'package:flutter_project_2/screen4.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'AdivinaState.dart';
import 'TayState.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AdivinaState()),
            ChangeNotifierProvider(create: (context) => TayState()),
          ],
          child:
          MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
              useMaterial3: true,
            ),
            initialRoute: "/screen1",
            routes: {
              '/screen1': (context) => screen1(),
              '/screen2': (context) => screen2(),
              '/screen3': (context) => screen3(),
              '/screen4': (context) => screen4()
            },
          )
      )
  );
}
