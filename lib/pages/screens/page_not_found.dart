import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Couldn't find what you are looking for",
            style: TextStyle(
              color: blackColor,
              fontSize: 16
            ),
          ),
          TextButton(
            onPressed: (){},
            child: Text(
              "Get back to home page",
              style: TextStyle(
                color: blackColor,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}