import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/routes/nav_controller.dart';

class PhoneHome extends StatefulWidget {
  const PhoneHome({Key? key}) : super(key: key);

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.blue,
                    child: localNav()
                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}