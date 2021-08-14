import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_condor/presenter/controllers/team_details_presenter.dart';

class TeamDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final idTeam = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-team-id';

    // teamPresenters.ptrTeamDetail(idTeam).then((value) {

    //   print("Detalle equipo ${value![0]['strTeamJersey']}");

    // });

    return FutureBuilder(
      future: teamPresenters.ptrTeamDetail(idTeam),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>?> snapshot ){

        final team = snapshot.data;

        print("Nombre equipo $team");

        if(snapshot.hasData){
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.indigo,
                  expandedHeight: height * 0.4,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      team![0]['strTeam'],
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                    background: FadeInImage(
                      placeholder: AssetImage('assets/images/loading.gif'),
                      image: AssetImage('assets/images/loading.gif'),
                      fit: BoxFit.cover,
                      // image: NetworkImage(team[0]['strTeamBadge']),
                    ),
                  ),
                )
              ],
            )
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

// class CustomAppBar( ddf )  {

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: Colors.indigo,
//       expandedHeight: 200,
//       floating: false,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         title: Text('HVHHB'),
//       ),
//     );
//   }
// }