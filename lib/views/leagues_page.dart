import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_condor/presenter/controllers/check_leagues_presenter.dart';
import 'package:league_condor/presenter/resources/responsive.dart';

class LeaguesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
                // Team badge
                leading: Image(
                  image: NetworkImage(leagues![i]['strTeamBadge'])
                ),
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

                    Navigator.pushNamed(context, 'team_detail', arguments: leagues[i]['idTeam'].toString())
                  
                },
              )
            ),
          );
        }else if(snapshot.hasError){

          return Text('Error loading information');

        }else{

          return Container(
            child: Center(child: CircularProgressIndicator()),
          );

        }      
      },
    );
    
  }
}