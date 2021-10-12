class CreatorHeader {
  int id;
  String name;
  String imageURL;
  String backgroundImageURL;
  int gamesCount;

  CreatorHeader(
      {this.id,
      this.name,
      this.backgroundImageURL,
      this.imageURL,
      this.gamesCount}) {
    if (this.imageURL == null) {
      this.imageURL = this.backgroundImageURL;
    }
  }

  String getGamesCountString() {
    return gamesCount.toString();
  }

  factory CreatorHeader.setFromJSON(Map<String, dynamic> json) {
    return CreatorHeader(
      id: json["id"],
      name: json["name"],
      imageURL: json["image"],
      backgroundImageURL: json["image_background"],
      gamesCount: json["games_count"],
    );
  }
}
