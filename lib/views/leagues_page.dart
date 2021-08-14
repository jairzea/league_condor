import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_condor/presenter/controllers/check_leagues_presenter.dart';
import 'package:league_condor/presenter/resources/responsive.dart';

class LeaguesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Responsive responsive = Responsive.of(context);

    return FutureBuilder(
      future: leaguesPresenters.ptrGetLeagues(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>?> snapshot ){

        final leagues = snapshot.data;

        if(snapshot.hasData){

          return Scaffold(
            appBar: AppBar(
              title: Text('Leagues', style: TextStyle(color: Colors.white)),
            ),
            body: ListView.builder(
              itemCount: leagues?.length,
              itemBuilder: ( _, i ) => ListTile(
                leading: Image(
                  image: NetworkImage(leagues![i]['strStadium'])
                ),
                // leading: Icon( Icons.home, color: Theme.of(context).primaryColor,),
                // Name league
                title: Text(leagues[i]['strTeam'],
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                  ),
                ),
                // Stadium league
                subtitle: Text(leagues[i]['strStadium'],
                style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: responsive.ip(1.5)
                  ),
                ),
                trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
                onTap: () => {

                    // Navigator.pushNamed(context, 'ver_listado_de_familias', arguments: leagues[i]['id'].toString())
                  
                },
              )
            ),
          );
        }else if(snapshot.hasError){

          return Text('Error al cargar la info');

        }else{

          return Container(
            child: Center(child: CircularProgressIndicator()),
          );

        }      
      },
    );
    // return ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: ( _, i) => ListTile(
    //     leading: Icon( Icons.map, color:  Theme.of(context).primaryColor ),
    //     title: Text('Nombre Liga',
    //       style: TextStyle(
    //         fontFamily: 'IndieFlower',
    //       ),
    //     ),
    //     subtitle: Text('Estadio de la liga',
    //       style: TextStyle(
    //         fontFamily: 'IndieFlower',
    //         fontSize: responsive.ip(1.5)
    //       ),
    //     ),
    //     trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
    //     onTap: () => print('Detalles'),
    //   )
    // );

    
  }

  // List<Widget> _listLeagues( List<dynamic> data ) {
    
  //   final List<Widget> leagues = [];

  //   data.forEach((element) { 

  //   });

  // }

}