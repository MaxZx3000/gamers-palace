class GameHeader {
  int id;
  String name;
  double rating;
  String imageBackgroundURL;

  GameHeader({this.id, this.name, this.rating, this.imageBackgroundURL});

  getRatingString() {
    return this.rating.toString();
  }

  factory GameHeader.setFromJSON(Map<String, dynamic> json) {
    return GameHeader(
        id: json['id'],
        name: json['name'],
        rating: json['rating'],
        imageBackgroundURL: json['background_image']);
  }
}
