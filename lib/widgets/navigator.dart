import 'package:flutter/material.dart';

navigateBack(destination){
  Navigator.pop(destination);
}

navigateForward(BuildContext context, destination){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
}

navigateNoReturn(context, destination){
  Navigator.pushAndRemoveUntil(context, destination, (route) => false);
}