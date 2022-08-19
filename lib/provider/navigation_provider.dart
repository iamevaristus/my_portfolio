import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  bool collapsed = false;

  bool get isCollapsed => collapsed;

  void toggleCollapsed(){
    collapsed = !collapsed;
    notifyListeners();
  }
}