import 'dart:convert';
import 'dart:io';

import 'package:howlongtobeat/api/games_request.dart';
import 'package:howlongtobeat/api/games_response.dart';
import 'package:http/http.dart';

class Games {
  static Future<GamesResponse> query(
    String query, {
    int page = 1,
  }) async {
    final request = GamesRequest(
      query.split(" "),
      searchPage: page,
    );
    final url = Uri.https("howlongtobeat.com", "api/search");
    final response = await post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.value,
        HttpHeaders.refererHeader: Uri.https("howlongtobeat.com").toString()
      },
      body: jsonEncode(request.toJson()),
    );

    final body = jsonDecode(response.body);
    return GamesResponse.fromJson(body);
  }
}
