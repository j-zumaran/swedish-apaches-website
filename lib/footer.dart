import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swedish_apaches/api.dart';
import 'package:url_launcher/url_launcher.dart';


class FooterSection extends StatelessWidget {
  const FooterSection(this.socialMediaButtons);

  final List<SocialMediaButton> socialMediaButtons;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(30),
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialMediaButtons,
          ),
          Spacer(),
          Text('All Rights Reserved The Swedish Apaches 2019',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
        ],
      ),
    );
  }

}

class SocialMediaButton extends StatelessWidget {

  static const ICON_SIZE = 32.0;

  final SocialMedia socialMedia;
  final String url;

  const SocialMediaButton(this.socialMedia, this.url);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: ICON_SIZE,
      icon: FaIcon(getIcon(socialMedia), color: Colors.white),
      onPressed: _launchURL,
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  IconData getIcon(SocialMedia sm) {
    switch(sm) {
      case SocialMedia.Youtube:
        return FontAwesomeIcons.youtube;
      case SocialMedia.Facebook:
        return FontAwesomeIcons.facebook;
      case SocialMedia.Instagram:
        return FontAwesomeIcons.instagram;
      case SocialMedia.Twitter:
        return FontAwesomeIcons.twitter;
    }
    return FontAwesomeIcons.phone;
  }
}