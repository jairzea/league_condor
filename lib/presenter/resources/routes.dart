

import 'package:flutter/cupertino.dart';
import 'package:league_condor/views/home_page.dart';
import 'package:league_condor/views/leagues_page.dart';

Map<String, Widget Function(BuildContext)> routes(){
  return {
    'home': (BuildContext context) => HomePage(),
    'leagues': (BuildContext context) => LeaguesPage(),
  };
}