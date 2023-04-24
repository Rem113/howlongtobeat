import 'package:howlongtobeat/models/game.dart';

class GamesResponse {
  final int? count;
  final int pageCurrent;
  final int? pageTotal;
  final int pageSize;
  final List<Game> games;

  GamesResponse.fromJson(Map<String, dynamic> json)
      : count = json["count"],
        pageCurrent = json["pageCurrent"],
        pageTotal = json["pageTotal"],
        pageSize = json["pageSize"],
        games = json["data"]
            .map((game) => Game.fromJson(game))
            .toList()
            .cast<Game>();
}
