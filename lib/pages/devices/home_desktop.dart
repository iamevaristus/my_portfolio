import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/routes/nav_controller.dart';
import 'package:website/widgets/drawer.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
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
                const PortfolioDrawer(),
                Expanded(
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