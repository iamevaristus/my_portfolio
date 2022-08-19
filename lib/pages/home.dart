import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/widgets/drawer.dart';

class HomePortfolio extends StatelessWidget {
  const HomePortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const PortfolioDrawer(),
              Column()
            ],
          )
        )
      ),
    );
  }
}