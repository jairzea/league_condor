
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:league_condor/presenter/controllers/team_details_presenter.dart';
import 'package:league_condor/presenter/resources/responsive.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Responsive responsive = Responsive.of(context);

    final idTeam = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-team-id';

    return FutureBuilder(
      future: teamPresenters.ptrTeamDetail(idTeam),
      initialData: [{'strTeam' : 'default'}],
      builder: ( context, AsyncSnapshot<List<dynamic>?> snapshot ){

        // ignore: unrelated_type_equality_checks
        if( snapshot.hasData == [] ){
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 150,
            child: CupertinoActivityIndicator(),
          );
        }

        final team = snapshot.data;

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
                    titlePadding: EdgeInsets.all(0),
                    background: _FlexibleSpaceBar( team![0]['strStadiumThumb'] ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    _headerInformation(
                      context,
                      team[0]['strTeamBadge'], 
                      team[0]['strTeam'],
                      team[0]['intFormedYear'],
                      team[0]['strTeamJersey'],
                      team[0]['strFacebook'],
                      team[0]['strTwitter'],
                      team[0]['strInstagram'],
                      responsive,
                      height, 
                      width ),
                      _description( team[0]['strDescriptionEN'], responsive ),
                  ])
                )
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(height: 50.0),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blueAccent[200],
              child: Icon( Typicons.globe ),
              onPressed: () {

                if( team[0]['strWebsite'] != '' && team[0]['strWebsite'] != null){
                  launch('https://${team[0]['strWebsite']}');
                
                }else{

                  this._showAlert( context );
                }

              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  Widget _FlexibleSpaceBar( estadiumThumb ){

    if( estadiumThumb != null ){

      return FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage( estadiumThumb ),
            fit: BoxFit.cover,
            // image: NetworkImage(team[0]['strTeamBadge']),
          );

    }else{

      return FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: AssetImage('assets/images/no-image.jpg'),
            fit: BoxFit.cover,
            // image: NetworkImage(team[0]['strTeamBadge']),
          );

    }
  }

  Widget _headerInformation( 
    context, 
    badge, 
    name, 
    foundation, 
    jersey,
    facebook,
    twitter,
    instagram,
    responsive, 
    height, 
    width ) {

      return Container(
        margin: EdgeInsets.only( top: 20 ),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Row(
          children: [
            _teamBadge( badge, height, width),
            SizedBox( width: width * 0.1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.0,
                  width: width * 0.4,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: ResponsiveFlutter.of(context).fontSize(3),
                        fontWeight: FontWeight.bold
                      ),                
                    ),
                  ),
                ),
                Text(
                  'Founded $foundation',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon( Typicons.facebook_circled),
                          tooltip: 'facebook',
                          onPressed: () {

                            if( facebook != '' && facebook != null){

                              launch('https://$facebook');
                            
                            }else{

                              this._showAlert( context );
                            }

                            
                          },
                        ),
                      ],
                    ),
                    // SizedBox( width: width * 0.04),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon( Typicons.twitter_circled),
                          tooltip: 'twitter',
                          onPressed: () {

                            if( twitter != '' && twitter != null){
                            
                              launch('https://$twitter');
                            
                            }else{

                              this._showAlert( context );
                            }

                          },
                        ),
                      ],
                    ),
                    // SizedBox( width: width * 0.04),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon( Typicons.camera_outline),
                          tooltip: 'web site',
                          onPressed: () {

                            if( instagram != '' && instagram != null){
                            
                              launch('https://$instagram');
                            
                            }else{

                              this._showAlert( context );
                            }

                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            _teamJersey( jersey, height, width ),
          ],
        ),
      );
    
  }

  Widget _teamBadge( badge, height, width ){

    if ( badge != null ) {
      
      return ClipRRect(
        child: FadeInImage(
          placeholder: AssetImage('assets/images/no-image.jpg'),
          image: NetworkImage( badge ),
          height: height * 0.1,
          width: width * 0.18,
        ),
      );

    }else{

      return ClipRRect(
        child: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: AssetImage('assets/images/no-image.jpg'),
          height: height * 0.1,
          width: width * 0.18,
        ),
      );

    }
    
  }

  Widget _teamJersey( jersey, height, width ){

    if ( jersey != null ) {

      return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage( jersey ),
                height: height * 0.1,
                width: width * 0.18,
              ),
            );
    }else{

      return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/images/loading.gif'),
                image: AssetImage('assets/images/no-image.jpg'),
                height: height * 0.1,
                width: width * 0.18,
              ),
            );
    }
  }



  Widget _description( description, responsive ){

    if ( description != null ) {
      
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20 ),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: responsive.ip(1.4),
                    ),
        ),
      );

    }else{
      
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20 ),
          child: Text(
            '',
            textAlign: TextAlign.justify,
            style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: responsive.ip(1.4),
                    ),
        ),
      );

    }

  }

  void _showAlert( BuildContext context ) {

      SweetAlert.show(
        context,
        title: "Oops.",
        subtitle: "Information not found",
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





