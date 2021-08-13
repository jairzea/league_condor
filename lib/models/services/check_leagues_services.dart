import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckLeaguesServices {

  Future<dynamic> mdlGetLeagues() async {

    final String urlPrueba = 'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=Spain';

    try {
      final resp = await http.get(Uri.parse(urlPrueba));
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
     
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

  
}