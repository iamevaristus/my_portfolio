import 'package:flutter/foundation.dart';

debugCode(text){
  if(kDebugMode){
    debugPrint(text.toString());
  }
}