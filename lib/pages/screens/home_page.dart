import 'package:flutter/material.dart';
import 'package:website/pages/screens/home/intro.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
          HomeIntroduction(),
        ],
      ),
    );
  }
}