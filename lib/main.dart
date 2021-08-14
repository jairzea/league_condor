import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:league_condor/presenter/resources/easy_loading.dart';
import 'package:league_condor/views/home_page.dart';

import 'presenter/resources/routes.dart';

void main() { runApp(new MaterialApp( 
                      debugShowCheckedModeBanner: false,
                      home: new MyApp(),
                      theme: ThemeData(
                      fontFamily: 'Permanent',
                        primarySwatch: Colors.blue,
                      ),
                  )); }
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget  {

  @override _MyAppState createState() => new _MyAppState(); 
  }

  class _MyAppState extends State { 
    @override void initState() { 
    super.initState(); 
    new Future.delayed( const Duration(seconds: 4), () =>
    Navigator.pushReplacement( context, 
    MaterialPageRoute(builder: (context) => HomePage()),
      ));
    }

    @override 
     Widget build(BuildContext context) {
     return new Scaffold(
      backgroundColor: Colors.white, 
       body: Container( 
       height: double.infinity, 
       width: double.infinity, 
      child: Image.asset("assets/images/splash.gif",
          gaplessPlayback: true, 
          fit: BoxFit.scaleDown,
        ),
      ));
      } 
      
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   CustomAnimation().customEasyLoad();
    
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Soccer Leagues',
  //     builder: EasyLoading.init(),
  //     initialRoute: 'home',
  //     routes: routes(),
  //     theme: ThemeData(
  //     fontFamily: 'Permanent',
  //       primarySwatch: Colors.blue,
  //     ),

  //   );
  // }
}

