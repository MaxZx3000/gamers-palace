class StoreHeader {
  int id;
  String name;
  String domain;
  String gamesCount;

  StoreHeader({this.id, this.name, this.domain, this.gamesCount});

  factory StoreHeader.setFromJSON(Map<String, dynamic> json) {
    Map<String, dynamic> storeJSON = json["store"];
    return StoreHeader(
        id: storeJSON["id"],
        name: storeJSON["name"],
        domain: storeJSON["domain"],
        gamesCount: storeJSON["games_count"]);
  }
}
