import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  bool collapsed = true;

  bool get isCollapsed => collapsed;

  void toggleCollapsed(){
    collapsed = !collapsed;
    notifyListeners();
  }
}