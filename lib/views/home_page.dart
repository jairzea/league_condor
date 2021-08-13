

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_condor/presenter/resources/responsive.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Pagina de inicio', style: TextStyle(color: Colors.white)),
        //   backgroundColor: Color.fromRGBO(75, 120, 170, 1),
        // ),
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage('assets/images/condor_labs.png'),
              width: 100,
            ),
            SizedBox(height: height * 0.15),
            _startupImage(height, width, responsive),
            SizedBox(height: height * 0.01),
            _myTittle(height, width, responsive),
            SizedBox(height: height * 0.01),
            _options(context, height, width, responsive),
            SizedBox(height: height * 0.01),
            _myData(height, width, responsive),
          ],
        ),
      ),
      
    );
    

  }

  Widget _startupImage(double height, double width, Responsive responsive){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/images/goal.json'),
        ],
      ),
    );
  }

  Widget _myTittle(double height, double width, Responsive responsive){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LEAGUE APP',
              style: TextStyle(fontSize: responsive.ip(4), color: Colors.black, fontWeight: FontWeight.w800 ),
          ),
        ],
      ),
    );
  }

  Widget _myData(double height, double width, Responsive responsive){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Check the soccer leagues',
              // 'Email: ${ blocLogin.email }',
              style: TextStyle(fontFamily: 'IndieFlower', fontSize: responsive.ip(1.4), color: Colors.grey),
            ),
        ],
      ),
    );
  }

  Widget _options(BuildContext context, double height, double width, Responsive responsive){
    return Table(
      children: [
        TableRow(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.all(15),
              child: CupertinoButton(
                padding: EdgeInsets.all(10),
                color: Color.fromRGBO(214, 172, 5, 1),
                borderRadius: BorderRadius.circular(15),
                onPressed: () { 
                  Navigator.pushNamed(context, 'see_leagues'); 
                },
                child: Text(
                  'See leagues',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: responsive.ip(2), 
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            )
          ],
        ),
  
      ],
    );
  }

}