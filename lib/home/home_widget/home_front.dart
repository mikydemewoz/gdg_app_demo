import 'package:flutter/material.dart';
import 'package:gdg_dev_fest/agenda/agenda_page.dart';
import 'package:gdg_dev_fest/bloc/config_bloc.dart';
import 'package:gdg_dev_fest/global/image_card.dart';
import 'package:gdg_dev_fest/home/social_actions.dart';
import 'package:gdg_dev_fest/speakers/speakers_page.dart';
import 'package:gdg_dev_fest/sponsor/sponsor_page.dart';
import 'package:gdg_dev_fest/team/team_page.dart';
import 'package:gdg_dev_fest/utils/devfest.dart';
import 'package:gdg_dev_fest/utils/tools.dart';

class HomeFront extends StatelessWidget {
  

  List<Widget> devFestText(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ];

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20,
        children: <Widget>[
          ActionCard(
            color: Colors.red,
            title: Devfest.agenda_text,
            press: () => Navigator.pushNamed(context, AgendaPage.routeName),
            icon: Icons.schedule,
          ),
          ActionCard(
            color: Colors.green,
            title: Devfest.speakers_text,
            press: () => Navigator.pushNamed(context, SpeakersPage.routeName),
            icon: Icons.person,
          ),
          ActionCard(
            color: Colors.amber,
            title: Devfest.team_text,
            press: () => Navigator.pushNamed(context, TeamPage.routeName),
            icon: Icons.people,
          ),
          ActionCard(
            color: Colors.purple,
            title: Devfest.sponsor_text,
            press: () => Navigator.pushNamed(context, SponsorPage.routeName),
            icon: Icons.attach_money,
          ),
          ActionCard(
            color: Colors.brown,
            title: Devfest.faq_text,
            press: (){},
            icon: Icons.question_answer,
          ),
          ActionCard(
            color: Colors.blue,
            title: Devfest.map_text,
            press: (){},
            icon: Icons.map,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              ImageCard(
                  img: ConfigBloc().darkModeOn
                      ? Devfest.banner_dark
                      : Devfest.banner_light),
              SizedBox(
                height: 20,
              ),
              ...devFestText(context),
              SizedBox(
                height: 20,
              ),
              newActions(context),
              SizedBox(
                height: 20,
              ),
              SocialActions(),
              SizedBox(
                height: 20,
              ),
              Text(Devfest.app_version,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 10))
            ],
          )),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function press;
  final String title;
  final IconData icon;
  final Color color;

  const ActionCard({Key key, this.press, this.title, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
