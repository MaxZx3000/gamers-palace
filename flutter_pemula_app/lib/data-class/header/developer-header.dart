class DeveloperHeader {
  int id;
  String name;
  int gamesCount;

  DeveloperHeader({this.id, this.name, this.gamesCount});

  String getGamesCountString() {
    return gamesCount.toString();
  }

  factory DeveloperHeader.setFromJSON(dynamic json) {
    return DeveloperHeader(
        id: json["id"], name: json["name"], gamesCount: json["games_count"]);
  }
}
