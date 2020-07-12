import 'package:flutter_ajtube/models/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_ajtube/CONFIG.dart';

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get('${Config.URL_BASE}/search'
        '?part=snippet'
        '&type=video'
        '&maxResults=20'
        '&order=date'
        '&key=${Config.CHAVE_YOUTUBE_API}'
        '&channelId=${Config.ID_CANAL}'
        '&q=$pesquisa');

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos =
          dadosJson['items'].map<Video>((video) => Video.fromJson(video));

      // for(var video in dadosJson['items']){

      // }
    }
  }
}
