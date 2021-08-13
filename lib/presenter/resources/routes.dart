

import 'package:flutter/cupertino.dart';
import 'package:league_condor/views/home_page.dart';

Map<String, Widget Function(BuildContext)> routes(){
  return {
    'home': (BuildContext context) => HomePage(),
  };
}