import 'package:flutter_pemula_app/data-class/header/developer-header.dart';
import 'package:flutter_pemula_app/data-class/header/game-header.dart';
import 'package:flutter_pemula_app/data-class/header/platform-header.dart';
import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';

class GameDetail extends GameHeader {
  String description;
  String websiteURL;
  String releasedDate;
  String esrbRating;
  int playtimeDuration;
  int numberOfMovies;
  int achievementsCount;
  List<PlatformHeader> platforms;
  List<DeveloperHeader> developers;
  List<PublisherHeader> publishers;

  GameDetail(
      {int id,
      String name,
      double rating,
      String imageBackgroundURL,
      this.description,
      this.websiteURL,
      this.releasedDate,
      this.esrbRating,
      this.playtimeDuration,
      this.numberOfMovies,
      this.achievementsCount,
      this.platforms,
      this.developers,
      this.publishers})
      : super(
            id: id,
            name: name,
            imageBackgroundURL: imageBackgroundURL,
            rating: rating);

  String getPlaytimeDurationString() {
    return '${this.playtimeDuration.toString()} hours';
  }

  String getAchievementsCountString() {
    return this.achievementsCount.toString();
  }

  String getReleasedDateString() {
    if (this.releasedDate == null) {
      return "Unknown";
    }
    return this.releasedDate.toString();
  }

  String getNumberOfMovies() {
    return '${this.numberOfMovies.toString()} times';
  }

  String getESRBRating() {
    if (this.esrbRating == null) {
      return 'Unknown';
    }
    return '${this.esrbRating.toString()}';
  }

  factory GameDetail.setFromJSON(Map<String, dynamic> json) {
    List<PlatformHeader> platforms = [];
    List<DeveloperHeader> developers = [];
    List<PublisherHeader> publishers = [];

    json['platforms'].forEach((dynamic platformHeaderJSON) {
      PlatformHeader platformHeader =
          PlatformHeader.setFromJSON(platformHeaderJSON);
      platforms.add(platformHeader);
    });
    json['developers'].forEach((dynamic developerHeaderJSON) {
      DeveloperHeader developerHeader =
          DeveloperHeader.setFromJSON(developerHeaderJSON);
      developers.add(developerHeader);
    });
    json['publishers'].forEach((dynamic publisherHeaderJSON) {
      PublisherHeader publisherHeader =
          PublisherHeader.setFromJSON(publisherHeaderJSON);
      publishers.add(publisherHeader);
    });
    return GameDetail(
        id: json['id'],
        name: json['name'],
        playtimeDuration: json['playtime'],
        numberOfMovies: json['movies_count'],
        description: json['description'],
        achievementsCount: json['achievements_count'],
        websiteURL: json['website'],
        rating: json['rating'],
        imageBackgroundURL: json['background_image'],
        releasedDate: json['released_at'],
        esrbRating:
            json['esrb_rating'] != null ? json['esrb_rating']['name'] : null,
        platforms: platforms,
        developers: developers,
        publishers: publishers);
  }
}
