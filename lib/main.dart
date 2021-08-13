import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:league_condor/presenter/resources/easy_loading.dart';

import 'presenter/resources/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CustomAnimation().customEasyLoad();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soccer Leagues',
      builder: EasyLoading.init(),
      initialRoute: 'home',
      routes: routes(),
      theme: ThemeData(
      fontFamily: 'Permanent',
        primarySwatch: Colors.blue,
      ),

    );
  }
}

