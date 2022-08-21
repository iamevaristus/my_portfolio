import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/res/responsive.dart';
import 'package:website/widgets/animated_text.dart';
import 'package:website/widgets/custom_text.dart';

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ResponsiveWidget.isDesktop(context)
        ? Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WebTextWidget(text: "Hi, I am Evaristus Adimonyemma"),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: AnimatedTextWidget(
                    text: "BE",
                    firstText: "YOU",
                    secondText: "AWESOME",
                    thirdText: "A GOAL GETTER",
                    color: mainColor,
                    size: 30,
                  ),
                )
              ]
            ),
          ],
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebTextWidget(
              text: "Hi, I am Evaristus Adimonyemma",
              color: mainColor,
              align: TextAlign.left,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: AnimatedTextWidget(
                text: "BE",
                firstText: "YOU",
                secondText: "AWESOME",
                thirdText: "A GOAL GETTER",
                color: mainColor,
                size: 30,
              ),
            )
          ],
        ),
    );
  }
}