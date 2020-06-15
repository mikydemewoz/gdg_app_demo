import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_dev_fest/agenda/session_details.dart';
import 'package:gdg_dev_fest/home/session.dart';
import 'package:gdg_dev_fest/utils/tools.dart';

class SessionList extends StatelessWidget {

  final List<Session> allSessions;

  const SessionList({Key key, this.allSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: allSessions.length,
      itemBuilder: (context,index){
        return Card(
          elevation: 0,
          child: ListTile(
            onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context)=> SessionDetails(
                  session: allSessions[index]
                )
                )
              );
            },
            isThreeLine: true,
            trailing: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "${allSessions[index].sessionTotalTime}\n",
                style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: allSessions[index].sessionStartTime,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12)
                  )
                ]
              )
            ),
            leading: Hero(
              tag: allSessions[index].speakerImage,
              child: CircleAvatar(
                radius:30,
                backgroundImage: CachedNetworkImageProvider(
                  allSessions[index].speakerImage
                ),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: "${allSessions[index].sessionTitle}\n",
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 16),
                children: [
                  TextSpan(
                    text: allSessions[index].speakerName,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 12,
                      color: Tools.multiColors[Random().nextInt(4)]
                    ),
                    children: []
                  )
                ]
              ),
            ),
            subtitle: Text(
              allSessions[index].speakerDesc,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10)
            ),
          ),
        );
      },
    );
  }
}