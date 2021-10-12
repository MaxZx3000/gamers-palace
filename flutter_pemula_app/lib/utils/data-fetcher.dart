import 'dart:convert';

import 'package:flutter_pemula_app/data-class/detail/creator-detail.dart';
import 'package:flutter_pemula_app/data-class/detail/game-detail.dart';
import 'package:flutter_pemula_app/data-class/detail/publisher-detail.dart';
import 'package:flutter_pemula_app/data-class/header/creator-header.dart';
import 'package:flutter_pemula_app/data-class/header/game-header.dart';
import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';
import 'package:flutter_pemula_app/utils/http-helpers.dart';

class DataFetcher {
  static Future<List<PublisherHeader>> getPublishersFromJSON(int index) async {
    final response = await HttpHelpers.fetchPublishersList(index);
    List<PublisherHeader> publishers = [];
    if (response.statusCode == 200) {
      dynamic results = jsonDecode(response.body)["results"];
      results.forEach((element) {
        PublisherHeader publisher = PublisherHeader.setFromJSON(element);
        publishers.add(publisher);
      });
      return publishers;
    } else {
      throw Exception("Publishers are failed to load!");
    }
  }

  static Future<List<GameHeader>> getGamesFromJSON(int index) async {
    final response = await HttpHelpers.fetchGamesList(index);
    List<GameHeader> games = [];
    if (response.statusCode == 200) {
      dynamic results = jsonDecode(response.body)["results"];
      results.forEach((element) {
        GameHeader gameHeader = GameHeader.setFromJSON(element);
        games.add(gameHeader);
      });
      return games;
    } else {
      throw Exception("Games are failed to load!");
    }
  }

  static Future<List<GameHeader>> getGamesByPublisherId(int id) async {
    final response = await HttpHelpers.fetchGamesByPublisherId(id);
    List<GameHeader> games = [];
    if (response.statusCode == 200) {
      dynamic results = jsonDecode(response.body)["results"];
      results.forEach((element) {
        GameHeader gameHeader = GameHeader.setFromJSON(element);
        games.add(gameHeader);
      });
      return games;
    } else {
      throw Exception("Games are failed to load!");
    }
  }

  static Future<GameDetail> getGameDetailById(int id) async {
    final response = await HttpHelpers.fetchGameById(id);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      GameDetail gameDetail = GameDetail.setFromJSON(result);
      return gameDetail;
    } else {
      throw Exception("Game is failed to load!");
    }
  }

  static Future<List<CreatorHeader>> getCreatorsFromJSON(int index) async {
    final response = await HttpHelpers.fetchCreatorsList(index);
    List<CreatorHeader> creators = [];
    if (response.statusCode == 200) {
      dynamic results = jsonDecode(response.body)["results"];
      results.forEach((element) {
        CreatorHeader creatorHeader = CreatorHeader.setFromJSON(element);
        creators.add(creatorHeader);
      });
      return creators;
    } else {
      throw Exception("Creators are failed to load!");
    }
  }

  static Future<CreatorDetail> getCreatorDetailById(int id) async {
    final response = await HttpHelpers.fetchCreatorById(id);
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      CreatorDetail creatorDetail = CreatorDetail.setFromJSON(result);
      return creatorDetail;
    } else {
      throw Exception('Creator is failed to load!');
    }
  }

  static Future<PublisherDetail> getPublisherDetailById(int id) async {
    final response = await HttpHelpers.fetchPublisherById(id);
    PublisherDetail publisherDetail;
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      publisherDetail = PublisherDetail.setFromJSON(result);
      return publisherDetail;
    } else {
      throw Exception("Publisher is failed to load!");
    }
  }
}
