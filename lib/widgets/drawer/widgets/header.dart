import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/config/images.dart';
import 'package:website/model/media_model.dart';
import 'package:website/res/responsive.dart';

class DrawHeader extends StatelessWidget {
  final bool collapsed;
  final List<MediaModel> media;
  const DrawHeader({
    Key? key,
    required this.collapsed,
    required this.media
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
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
}