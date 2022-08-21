import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/model/media_model.dart';
import 'package:website/res/responsive.dart';

class DrawFooter extends StatelessWidget {
  final bool collapsed;
  final List<MediaModel> media;
  const DrawFooter({
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

    return collapsed ? ListView.separated(
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
}