import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/pages/home.dart';
import 'package:website/provider/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/" :(context) => const HomePortfolio(),
        },
      ),
    );
  }
}