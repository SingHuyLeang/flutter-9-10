import 'package:flutter/foundation.dart';

class DataState with ChangeNotifier {
  int count = 0;
  // change notifier
  void incrementCount() {
    count++;
    notifyListeners();
  }
  // change notifier
  void descrementCount() {
    count --;
    notifyListeners();
  }

}