import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:website/config/debug.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final String firstText;
  final String secondText;
  final String thirdText;
  const AnimatedTextWidget({
    Key? key,
    this.text = "",
    required this.firstText,
    required this.secondText,
    required this.thirdText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 100.0),
        Text(
          text,
          style: const TextStyle(fontSize: 43.0),
        ),
        const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            fontFamily: 'Horizon',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(firstText),
              RotateAnimatedText(secondText),
              RotateAnimatedText(thirdText),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedColoredText extends StatelessWidget {
  final String text;
  const AnimatedColoredText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: TextLiquidFill(
        text: text,
        waveColor: Colors.blueAccent,
        boxBackgroundColor: Colors.redAccent,
        textStyle: const TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 300.0,
      ),
    );
  }
}

class AnimatedWavyText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  const AnimatedWavyText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.thirdText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

    return SizedBox(
      width: 250.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            firstText,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            secondText,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            thirdText,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          debugCode("tapped me");
        },
      ),
    );
  }
}

class AnimatedFlickerText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  const AnimatedFlickerText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.thirdText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(firstText),
            FlickerAnimatedText(secondText),
            FlickerAnimatedText(thirdText),
          ],
          onTap: () {
            debugCode("Tap Event");
          },
        ),
      ),
    );
  }
}