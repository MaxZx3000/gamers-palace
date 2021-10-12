import 'package:flutter_pemula_app/globals/api-endpoint.dart';
import 'package:http/http.dart' as http;

class HttpHelpers {
  static Future<http.Response> fetchGenresList() {
    return http.get(ApiEndpoint.genres());
  }

  static Future<http.Response> fetchPublishersList(int index) {
    return http.get(ApiEndpoint.publishers(index));
  }

  static Future<http.Response> fetchStoresList() {
    return http.get(ApiEndpoint.stores());
  }

  static Future<http.Response> fetchGamesList(int index) {
    return http.get(ApiEndpoint.games(index));
  }

  static Future<http.Response> fetchGamesByPublisherId(int id) {
    return http.get(ApiEndpoint.gamesByPublisherId(id));
  }

  static Future<http.Response> fetchCreatorsList(int index) {
    return http.get(ApiEndpoint.creators(index));
  }

  static Future<http.Response> fetchCreatorById(int id) {
    return http.get(ApiEndpoint.creatorDetail(id));
  }

  static Future<http.Response> fetchPublisherById(int id) {
    return http.get(ApiEndpoint.publisherDetail(id));
  }

  static Future<http.Response> fetchGameById(int id) {
    return http.get(ApiEndpoint.gameDetail(id));
  }
}
