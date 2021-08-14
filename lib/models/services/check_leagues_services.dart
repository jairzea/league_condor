import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckLeaguesServices {

  Future<dynamic> mdlGetLeagues( idLeague ) async {

    final String urlLeagues = 'https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=$idLeague';

    try {
      final resp = await http.get(Uri.parse(urlLeagues));
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
     
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

  
}