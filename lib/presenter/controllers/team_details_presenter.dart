
import 'dart:convert';

import 'package:league_condor/models/services/team_detail_services.dart';

class _TeamDetailPresenters {

  List<dynamic> team = [];

  Future<List<dynamic>?> ptrTeamDetail( idTeam ) async {
  
    final answer = await TeamDetailServices().mdlTeamDetail( idTeam );

    Map dataTeam = json.decode(answer);
    
    team = dataTeam['teams'];

    return team;
    
  }

}

final teamPresenters = new _TeamDetailPresenters();