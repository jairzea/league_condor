
import 'dart:convert';

import 'package:league_condor/models/services/check_leagues_services.dart';

class _CheckLeaguesPresenters {

  List<dynamic> leagues = [];

  _CheckLeaguesPresenters(){
    // ptrGetLeagues();
  }

  Future<List<dynamic>?> ptrGetLeagues() async {
  
    final answer = await CheckLeaguesServices().mdlGetLeagues();

    Map dataLeagues = json.decode(answer);
    leagues = dataLeagues['teams'];

    return leagues;
    
  }

}

final leaguesPresenters = new _CheckLeaguesPresenters();