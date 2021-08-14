


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_condor/presenter/resources/responsive.dart';
import 'package:league_condor/views/leagues_page.dart';
import 'package:lottie/lottie.dart';
import 'package:sweetalert/sweetalert.dart';

class HomePage extends StatefulWidget   {

   @override
  _Home createState() => _Home();
}

class _Home extends State<HomePage> {

  String _selectedOption = 'Select a league';

  // 4335, 4344, 4332, 4328
  List<String> _leagues = ['Select a league', 'Spanish league', 'Portuguese Primeira Liga', 'Italian Serie A', 'English Premier League'];

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
      child: Scaffold(
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage('assets/images/condor_labs.png'),
              width: 100,
            ),
            SizedBox(height: height * 0.10),
            _startupImage(height, width, responsive),
            SizedBox(height: height * 0.01),
            _myTittle(height, width, responsive),
            SizedBox(height: height * 0.01),
            _dropDown(      responsive),
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
            'Check by football leagues',
              // 'Email: ${ blocLogin.email }',
              style: TextStyle(fontFamily: 'IndieFlower', fontSize: responsive.ip(1.4), color: Colors.grey),
            ),
        ],
      ),
    );
  }
  
  List<DropdownMenuItem<String>> getOptions(responsive){

    List<DropdownMenuItem<String>> list =[];

    _leagues.forEach((league) { 

      list.add( DropdownMenuItem(
        child: Text(
          league,
          style: TextStyle(fontFamily: 'IndieFlower', fontSize: responsive.ip(1.7), color: Colors.grey),
          ),
        value: league,
      ));
    });

    return list;
  }

  Widget _dropDown( responsive ){

    return DropdownButton(
      value: _selectedOption,
      items: getOptions(responsive),
      onChanged: (opt){
        setState((){
          _selectedOption = opt.toString();
        });
      },
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
                  
                  if (_selectedOption != 'Select a league') {


                    Navigator.push( 
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LeaguesPage(todo: _selectedOption )
                      ),
                    );

                    // print('kjnkjmnk');

                    // MaterialPageRoute(builder: (context) => LeaguesPage());

                    // Navigator.pushNamed(context, 'leagues', arguments: _selectedOption ); 

                  }else{

                    this._showAlert( context );
                  }
                  
                },
                child: Text(
                  'See teams',
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

  void _showAlert( BuildContext context ) {

      SweetAlert.show(
        context,
        title: "Oops.",
        subtitle: "Please select a league",
        style: SweetAlertStyle.confirm,
        confirmButtonText: 'Ok',
        onPress: (bool isConfirm) {
          
          if (isConfirm) {
            
            Navigator.of(context).pop();
            
          }
          return false;
        }
      );
    }

}