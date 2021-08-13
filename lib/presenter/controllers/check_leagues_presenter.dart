
import 'package:league_condor/models/services/check_leagues_services.dart';

class CheckLeaguesPresenters {

  Future<dynamic> ptrGetLeagues() async {
  
    var leaguesPresenter = await CheckLeaguesServices().mdlGetLeagues();

    return leaguesPresenter;
    
  }
}