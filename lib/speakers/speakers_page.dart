import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_dev_fest/global/dev_scaffold.dart';
import 'package:gdg_dev_fest/home/social_actions.dart';
import 'package:gdg_dev_fest/home/speaker.dart';
import 'package:gdg_dev_fest/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakersPage extends StatelessWidget {
  static const String routeName = '/speakers';

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: 'Speakers',
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: speakers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3),
                      child: CachedNetworkImage(
                        imageUrl: speakers[index].speakerImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(speakers[index].speakerName),
                          SizedBox(
                            height: 5,
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 5,
                            color: Tools.multiColors[Random().nextInt(4)],
                          ),
                          Text(
                            speakers[index].speakerDesc,
                            style: Theme.of(context).textTheme.subtitle1
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            speakers[index].speakerSession,
                            style: Theme.of(context).textTheme.caption
                          ),
                          SocialActions(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
