import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';
import 'package:website/routes/nav_controller.dart';
import 'package:website/widgets/drawer.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({Key? key}) : super(key: key);

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
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
                    color: Colors.purple.shade100,
                    child: localNav(),
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