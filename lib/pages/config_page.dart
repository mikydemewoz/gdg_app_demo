import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_dev_fest/agenda/agenda_page.dart';
import 'package:gdg_dev_fest/bloc/config_bloc.dart';
import 'package:gdg_dev_fest/home/home_page.dart';
import 'package:gdg_dev_fest/speakers/speakers_page.dart';
import 'package:gdg_dev_fest/sponsor/sponsor_page.dart';
import 'package:gdg_dev_fest/team/team_page.dart';
import 'package:gdg_dev_fest/utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setUpApp();
  }

  setUpApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn = Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(builder: (context, state) {
        return MaterialApp(
          title: 'Google Devfest',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: Devfest.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(elevation: 0.0)),
          home: HomePage(),
          routes: {
            HomePage.routeName: (context)=>HomePage(),
            AgendaPage.routeName: (context)=>AgendaPage(),
            SpeakersPage.routeName: (context)=>SpeakersPage(),
            TeamPage.routeName: (context)=>TeamPage(),
            SponsorPage.routeName: (context)=>SponsorPage()
          },
        );
      }),
    );
  }
}
