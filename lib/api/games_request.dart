class GamesRequest {
  static const String searchType = "games";

  final List<String> searchTerms;
  final int searchPage;
  final int size;
  final SearchOptions searchOptions;

  const GamesRequest(
    this.searchTerms, {
    this.searchPage = 1,
    this.size = 20,
    this.searchOptions = const SearchOptions.none(),
  });

  Map<String, dynamic> toJson() => {
        'searchType': searchType,
        'searchTerms': searchTerms,
        'searchPage': searchPage,
        'size': size,
        'searchOptions': searchOptions.toJson(),
      };
}

class SearchOptions {
  final Games games = const Games.none();
  final Users users = const Users.none();
  final Lists lists = const Lists.none();
  final String filter = "";
  final int sort = 0;
  final int randomizer = 0;

  const SearchOptions.none();

  Map<String, dynamic> toJson() => {
        'games': games.toJson(),
        'users': users.toJson(),
        'lists': lists.toJson(),
        'filter': filter,
        'sort': sort,
        'randomizer': randomizer,
      };
}

class Games {
  final String platform = "";
  final String sortCategory = "popular";
  final String rangeCategory = "main";
  final RangeTime rangeTime = const RangeTime.none();
  final Gameplay gameplay = const Gameplay.none();
  final RangeYear rangeYear = const RangeYear.none();
  final String modifier = "";

  const Games.none();

  Map<String, dynamic> toJson() => {
        'platform': platform,
        'sortCategory': sortCategory,
        'rangeCategory': rangeCategory,
        'rangeTime': rangeTime.toJson(),
        'gameplay': gameplay.toJson(),
        'rangeYear': rangeYear.toJson(),
        'modifier': modifier,
      };
}

class RangeTime {
  final int? min = null;
  final int? max = null;

  const RangeTime.none();

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}

class Gameplay {
  final String perspective = "";
  final String flow = "";
  final String genre = "";

  const Gameplay.none();

  Map<String, dynamic> toJson() => {
        'perspective': perspective,
        'flow': flow,
        'genre': genre,
      };
}

class RangeYear {
  final String min = "";
  final String max = "";

  const RangeYear.none();

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}

class Users {
  final String sortCategory = "postcount";

  const Users.none();

  Map<String, dynamic> toJson() => {
        'sortCategory': sortCategory,
      };
}

class Lists {
  final String sortCategory = "follows";

  const Lists.none();

  Map<String, dynamic> toJson() => {
        'sortCategory': sortCategory,
      };
}
