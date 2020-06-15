import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_dev_fest/pages/config_page.dart';
import 'package:gdg_dev_fest/utils/devfest.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
  ]);

  Devfest.prefs = await SharedPreferences.getInstance();

  

  runApp(ConfigPage());
}


