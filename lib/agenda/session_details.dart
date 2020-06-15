import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_dev_fest/global/dev_scaffold.dart';
import 'package:gdg_dev_fest/home/session.dart';
import 'package:gdg_dev_fest/home/social_actions.dart';
import 'package:gdg_dev_fest/utils/tools.dart';

class SessionDetails extends StatelessWidget {

  final Session session;

  const SessionDetails({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: session.speakerName,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: session.speakerImage,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: CachedNetworkImageProvider(
                      session.speakerImage
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${session.speakerDesc}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: Tools.multiColors[Random().nextInt(4)]
                )
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${session.sessionTitle}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                session.sessionDesc,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
              SizedBox(
                height: 20,
              ),
              SocialActions(),
            ],
          )
        )
      ),
    );
  }
}