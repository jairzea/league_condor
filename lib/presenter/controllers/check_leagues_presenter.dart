
import 'dart:convert';

import 'package:league_condor/models/services/check_leagues_services.dart';

class _CheckLeaguesPresenters {

  List<dynamic> leagues = [];

  _CheckLeaguesPresenters(){
    // ptrGetLeagues();
  }

  Future<List<dynamic>?> ptrGetLeagues( selectedLeague ) async {

    String? idLeague;

    if ( selectedLeague == 'English Premier League' ) {

      idLeague = '4328';

    }else if (selectedLeague == 'Portuguese Primeira Liga') {
      
      idLeague = '4344';

    }else if (selectedLeague == 'Italian Serie A') {
      
      idLeague = '4332';

    }else{

      idLeague = '4335';

    }
  
    final answer = await CheckLeaguesServices().mdlGetLeagues( idLeague );

    Map dataLeagues = json.decode(answer);
    leagues = dataLeagues['teams'];

    return leagues;
    
  }

}

final leaguesPresenters = new _CheckLeaguesPresenters();