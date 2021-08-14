import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamDetailServices {

  Future<dynamic> mdlTeamDetail( idTeam ) async {

    final String urlDetailTeam = 'https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=$idTeam';

    try {
      final resp = await http.get(Uri.parse(urlDetailTeam));
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
     
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

  
}