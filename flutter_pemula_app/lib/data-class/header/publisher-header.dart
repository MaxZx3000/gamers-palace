class PublisherHeader {
  final int id;
  final String name;
  final int gamesCount;
  final String imageBackgroundURL;

  PublisherHeader(
      {this.id, this.name, this.gamesCount, this.imageBackgroundURL});

  factory PublisherHeader.setFromJSON(dynamic json) {
    return PublisherHeader(
        id: json['id'],
        name: json['name'],
        gamesCount: json['games_count'],
        imageBackgroundURL: json['image_background']);
  }
}
