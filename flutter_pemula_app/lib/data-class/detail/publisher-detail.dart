import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';

class PublisherDetail extends PublisherHeader {
  String description;

  PublisherDetail(
      {int id,
      String name,
      int gamesCount,
      String imageBackgroundURL,
      this.description})
      : super(
            id: id,
            name: name,
            gamesCount: gamesCount,
            imageBackgroundURL: imageBackgroundURL);

  factory PublisherDetail.setFromJSON(Map<String, dynamic> json) {
    return PublisherDetail(
        id: json['id'],
        name: json['name'],
        gamesCount: json['games_count'],
        imageBackgroundURL: json['image_background'],
        description: json['description']);
  }
}
