import 'package:flutter/material.dart';
import 'package:website/config/icons.dart';
import 'package:website/pages/devices/home_desktop.dart';
import 'package:website/pages/devices/home_phone.dart';
import 'package:website/pages/devices/home_tablet.dart';
import 'package:website/res/responsive.dart';

class WebDeviceLayout extends StatelessWidget {
  const WebDeviceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: ResponsiveWidget.isPhone(context)
        ? AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: menuIcon
          ),
        )
        : null,
      body: const ResponsiveWidget(
        desktop: DesktopHome(),
        phone: PhoneHome(),
        tablet: TabletHome()
      ),
    );
  }
}