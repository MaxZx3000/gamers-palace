import 'package:flutter_pemula_app/data-class/header/creator-header.dart';
import 'package:flutter_pemula_app/data-class/header/platform-header.dart';
import 'package:flutter_pemula_app/data-class/header/position-header.dart';
import 'package:flutter_pemula_app/data-class/header/timeline-header.dart';

class CreatorDetail extends CreatorHeader {
  String description;
  String rating;
  List<PositionHeader> positions;
  List<PlatformHeader> platforms;
  List<TimelineHeader> timeline;

  CreatorDetail(
      {int id,
      String name,
      String imageURL,
      String backgroundImageURL,
      int gamesCount,
      this.description,
      this.rating,
      this.positions,
      this.platforms,
      this.timeline})
      : super(
            id: id,
            name: name,
            imageURL: imageURL,
            backgroundImageURL: backgroundImageURL,
            gamesCount: gamesCount);

  factory CreatorDetail.setFromJSON(Map<String, dynamic> json) {
    List<PositionHeader> positions = [];
    List<PlatformHeader> platforms = [];
    List<TimelineHeader> timeline = [];

    json['platforms']["results"].forEach((dynamic platformHeaderJSON) {
      PlatformHeader platformHeader =
          PlatformHeader.setFromJSON(platformHeaderJSON);
      platforms.add(platformHeader);
    });
    json['positions'].forEach((dynamic positionHeaderJSON) {
      PositionHeader platformHeader =
          PositionHeader.setFromJSON(positionHeaderJSON);
      positions.add(platformHeader);
    });
    json['timeline'].forEach((dynamic timelineHeaderJSON) {
      TimelineHeader timelineHeader =
          TimelineHeader.setFromJSON(timelineHeaderJSON);
      timeline.add(timelineHeader);
    });
    return CreatorDetail(
        id: json["id"],
        name: json["name"],
        imageURL: json["image"],
        backgroundImageURL: json["image_background"],
        gamesCount: json["games_count"],
        rating: json["rating"],
        description: json["description"],
        platforms: platforms,
        positions: positions,
        timeline: timeline);
  }
}
