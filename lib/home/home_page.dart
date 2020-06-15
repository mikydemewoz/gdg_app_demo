import 'package:flutter/material.dart';
import 'package:gdg_dev_fest/global/dev_scaffold.dart';
import 'package:gdg_dev_fest/home/bloc/home_bloc.dart';
import 'package:gdg_dev_fest/home/home_screen.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var homeBloc = HomeBloc();
    return DevScaffold(
        title: 'Home',
        body: HomeScreen(
          homeBloc: homeBloc,
        ));
  }
}
