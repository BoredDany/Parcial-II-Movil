import 'package:flutter/cupertino.dart';


class TayState extends ChangeNotifier {
  String? titulo;
  List<String>? autores;
  String? duracion;

  String? getTitulo() => titulo;
  List<String>? getAutores() => autores;
  String? getDuracion()=> duracion;

  void setSongData(String titulo, List<String> autores, String duracion) {
    this.titulo = titulo;
    this.autores = autores;
    this.duracion = duracion;
    notifyListeners();
  }
}