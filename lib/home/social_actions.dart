import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialActions extends StatelessWidget {

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.facebookF),
                onPressed: () async {
                  await _launchURL("https://facebook.com");
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () async {
                  await _launchURL("https://twitter.com");
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.linkedin),
                onPressed: () async {
                  await _launchURL("https://linkedin.com");
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.youtube),
                onPressed: () async {
                  await _launchURL("https://youtube.com");
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.meetup),
                onPressed: () async {
                  await _launchURL("https://meetup.com");
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.envelope),
                onPressed: () async {
                  var emailUrl =
                      ''' mailto:gdmichaeldemewoz@gmail.com?subject=Support needed for Devfest App&body={Name: miky deme},Email:dgmichaeldemewoz@gmail.com  ''';
                  var out = Uri.encodeFull(emailUrl);
                  await _launchURL(out);
                })
          ],
        ),
      );
  }
}