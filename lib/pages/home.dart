import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/config/images.dart';
import 'package:website/widgets/animated_text.dart';
import 'package:website/widgets/drawer.dart';

class HomePortfolio extends StatelessWidget {
  const HomePortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Row(
            children: [
              const PortfolioDrawer(),
              Column(
                children: [
                  homeHeader()
                ],
              )
            ],
          )
        )
      ),
    );
  }

  Widget homeHeader() {
    return Row(
      children: [
        Image.asset(
          picCutOffOne
        ),
        Column(
          children: const [
            Text(
              "Hi, I am Evaristus Adimonyemma",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            AnimatedTextWidget(
              text: "BE",
              firstText: "YOU",
              secondText: "A GOAL GETTER",
              thirdText: "UNSTOPPABLE"
            )
          ],
        ),
      ],
    );
  }
}