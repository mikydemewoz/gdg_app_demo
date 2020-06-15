import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_dev_fest/agenda/session_list.dart';
import 'package:gdg_dev_fest/global/dev_scaffold.dart';
import 'package:gdg_dev_fest/home/session.dart';
import 'package:gdg_dev_fest/utils/tools.dart';

class AgendaPage extends StatelessWidget {

  static const String routeName = '/agenda';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DevScaffold(
        title: 'Agenda',
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          tabs: <Widget>[
            Tab(
              child: Text('Cloude'),
              icon: Icon(FontAwesomeIcons.cloud,size: 12,),
            ),
            Tab(
              child: Text('Mobile'),
              icon: Icon(FontAwesomeIcons.mobile,size: 12,),
            ),
            Tab(
              child: Text('Web'),
              icon: Icon(FontAwesomeIcons.chrome,size: 12,),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            SessionList(allSessions: sessions),
            SessionList(allSessions: sessions),
            SessionList(allSessions: sessions)
          ],
        ),
      ),
    );
  }
}