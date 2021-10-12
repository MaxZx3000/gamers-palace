class PlatformHeader {
  int id;
  String name;
  String releasedAt;
  int gamesCount;

  PlatformHeader({this.id, this.name, this.releasedAt, this.gamesCount});

  String getGamesCountString() {
    return gamesCount.toString();
  }

  factory PlatformHeader.setFromJSON(dynamic json) {
    Map<String, dynamic> platformJSON = json["platform"];
    return PlatformHeader(
        id: platformJSON["id"],
        name: platformJSON["name"],
        releasedAt: json["released_at"],
        gamesCount: json["count"]);
  }
}
