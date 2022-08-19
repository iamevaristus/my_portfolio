import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/config/colors.dart';
import 'package:website/config/icons.dart';
import 'package:website/config/images.dart';
import 'package:website/data/drawer_data.dart';
import 'package:website/data/media_data.dart';
import 'package:website/model/drawer_model.dart';
import 'package:website/model/media_model.dart';
import 'package:website/provider/navigation_provider.dart';
import 'package:website/res/responsive.dart';
import 'package:website/routes/nav_controller.dart';
import 'package:website/routes/routes.dart';

class PortfolioDrawer extends StatefulWidget {
  const PortfolioDrawer({Key? key}) : super(key: key);

  @override
  State<PortfolioDrawer> createState() => _PortfolioDrawerState();
}

class _PortfolioDrawerState extends State<PortfolioDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 2);

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  String startStatement() {
    var hour = DateTime.now().hour;
    if(hour == 12 && hour < 5){
      return '"We\'ve got one life to live!. Let\'s go all in!"';
    }
    else if (hour < 5) {
      return '"I strongly believe that technology has more to offer. After all, it is the invention of man."';
    } else if (hour < 10) {
      return '"There is no time which is late. We all have our own starting point. Push beyond and you will excel."';
    } else if (hour < 16) {
      return '"Talent, Money and Grace is the foundation you need. But hardwork, crowns it all to success."';
    } else if (hour < 20) {
      return '"Pray that you will never lose yourself in the race. That\'s one thing you will forever regret."';
    }
    return '"Rest, have fun and make sure to have a good night sleep. It never stops,"';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    final collapsed = provider.collapsed;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: collapsed ? 70 : 150,
      decoration: BoxDecoration(color: drawerColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          header(collapsed, mediaData),
          ResponsiveWidget.isDesktop(context)
            ? const SizedBox(height: 30,)
            : const SizedBox(height: 10,),
          drawerList(items: drawerData, collapsed: collapsed),
          ResponsiveWidget.isDesktop(context)
            ? const SizedBox(height: 30,)
            : const SizedBox(height: 5,),
          const Divider(color: Colors.white),
          const SizedBox(height: 10,),
          drawerFooter(collapsed, mediaData),
          const Spacer(),
          collapseIcon(collapsed, context)
        ],
      ),
    );
  }

  header(bool collapsed, List<MediaModel> media) {
    return collapsed ? ClipOval(
      child: Image.asset(
        profilePic,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    )
    : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            profilePicTwo,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        ResponsiveWidget.isDesktop(context)
          ? const SizedBox(height: 20,)
          : const SizedBox(height: 10,),
        const Text(
          "Evaristus Adimonyemma",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: media.length
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: media.length,
          itemBuilder: (context, index) {
            final social = media[index];
            return InkWell(
              onTap: () => launchInBrowser(social.link),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  social.image,
                ),
              ),
            );
          }
        )
      ],
    );
  }

  collapseIcon(bool collapsed, BuildContext context) {
    const double size = 42;
    final icon = collapsed ? forward : backward;
    final align = collapsed ? Alignment.center : Alignment.centerRight;
    final margin = collapsed ? null : const EdgeInsets.only(right: 10);
    final width = collapsed ? double.infinity : size;

    return Container(
      alignment: align,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final provider =
              Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleCollapsed();
          },
          child: SizedBox(
            width: width,
            height: size,
            child: icon,
          ),
        ),
      ),
    );
  }

  drawerList({required bool collapsed, required List<DrawerModel> items}) {
    const padded = EdgeInsets.symmetric(horizontal: 5);
    return ListView.separated(
      padding: collapsed ? padded : padding,
      shrinkWrap: true,
      primary: false,
      itemCount: items.length,
      separatorBuilder: (context, index) =>
        ResponsiveWidget.isDesktop(context)
          ? const SizedBox(height: 5,)
          : const SizedBox(height: 1,),
      itemBuilder: (context, index) {
        final item = items[index];
        return menuItem(
          collapsed: collapsed,
          text: item.title,
          icon: item.icon,
          click: () => selectPage(context, index),
        );
      }
    );
  }

  void selectPage(BuildContext context, int index){
    switch (index) {
      case 0:
        navController.navForward(homeRoute);
        break;
      case 1:
        navController.navForward(aboutRoute);
        break;
      case 2:
        navController.navForward(contactRoute);
        break;
      case 4:
        navController.navForward(galleryRoute);
        break;
      default:
      navController.navForward(homeRoute);
    }
  }

  menuItem({
    required bool collapsed,
    required String text,
    required Icon icon,
    VoidCallback? click,
  }) {
    const color = Colors.white;

    return Material(
      color: Colors.transparent,
      child: collapsed ? ListTile(
        leading: icon,
        onTap: click,
      ) : ListTile(
        leading: icon,
        title: Text(text,
        style: const TextStyle(color: color, fontSize: 14)),
        onTap: click,
      ),
    );
  }

  drawerFooter(
    bool collapsed,
    List<MediaModel> media
  ) => collapsed ? ListView.separated(
    shrinkWrap: true,
    itemCount: media.length,
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (context, index) =>
      ResponsiveWidget.isDesktop(context)
        ? const SizedBox(height: 20,)
        : const SizedBox(height: 10,),
    itemBuilder: (context, index) {
      final social = media[index];
      return InkWell(
        onTap: () => launchInBrowser(social.link),
        child: Image.asset(
          social.image,
          width: ResponsiveWidget.isDesktop(context) ? 20 : 15,
          height: ResponsiveWidget.isDesktop(context) ? 20 : 15,
        ),
      );
    }
  ) : Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      startStatement(),
      style: const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.italic
      ),
      textAlign: TextAlign.center,
    ),
  );
}
