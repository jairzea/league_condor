import 'dart:convert';

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

    CheckLeaguesPresenters().ptrGetLeagues().then((value) => {

      // print(jsonDecode(value))

    });

    return FutureBuilder<dynamic>(
      future: CheckLeaguesPresenters().ptrGetLeagues(),
      builder: (_, AsyncSnapshot<dynamic> snapshotDBViviendas){
        if(snapshotDBViviendas.hasData){

          final leagues = snapshotDBViviendas.data;

            return Scaffold(
              appBar: AppBar(
                title: Text('Viviendas', style: TextStyle(color: Colors.white)),
              ),
              body: ListView.builder(
                  itemCount: leagues?.length,
                  itemBuilder: (BuildContext context, int index ) => ListTile(
                    leading: Icon( Icons.home, color: Theme.of(context).primaryColor,),
                    title: Text('Nombre equipo'),
                    subtitle: Text('Estadio equipo'),
                    trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
                    onTap: () => {

                      Navigator.pushNamed(context, 'ver_listado_de_familias', arguments: leagues[index]['id'].toString())                      
                      
                    },
                  )
                ),
            );
        }else if(snapshotDBViviendas.hasError){
          return Text('Error al cargar la info');
        }else{
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

}