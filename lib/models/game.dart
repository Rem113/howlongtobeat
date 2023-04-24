class Game {
  final String name;
  final Uri image;
  final Uri smallImage;
  final Duration mainStoryCompletionTime;
  final Duration mainPlusExtraCompletionTime;
  final Duration completionistCompletionTime;

  const Game(
      this.name,
      this.image,
      this.smallImage,
      this.mainStoryCompletionTime,
      this.mainPlusExtraCompletionTime,
      this.completionistCompletionTime);

  Game.fromJson(Map<String, dynamic> json)
      : name = json["game_name"],
        image = Uri.https("howlongtobeat.com", "games/${json["game_image"]}"),
        smallImage = Uri.https(
            "howlongtobeat.com", "games/${json["game_image"]}", {"width": "100"}),
        mainStoryCompletionTime = Duration(seconds: json["comp_main"]),
        mainPlusExtraCompletionTime = Duration(seconds: json["comp_plus"]),
        completionistCompletionTime = Duration(seconds: json["comp_100"]);
}
