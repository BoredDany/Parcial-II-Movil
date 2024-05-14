import 'package:flutter/cupertino.dart';

class AdivinaState extends ChangeNotifier {
  String message = "";
  int tries = 0;

  String getMessage() => message;
  int getTries() => tries;

  setMessage(String m) {
    message = m;
    notifyListeners();
  }

  incrementTries() {
    tries++;
    notifyListeners();
  }
}