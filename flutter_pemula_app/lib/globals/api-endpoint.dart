class ApiEndpoint {
  static final String _apiKey = "ebce504196ac4a7aa049fc6483e97531";
  static final String _baseApiUrl = 'https://api.rawg.io/api';

  static String _getKeyParams() {
    return 'key=$_apiKey';
  }

  static String _getPageIndexParams(int index) {
    return 'page=$index';
  }

  static String games(int index) {
    return '$_baseApiUrl/games?${_getPageIndexParams(index)}&${_getKeyParams()}';
  }

  static String gamesByPublisherId(int id) {
    return '$_baseApiUrl/games?publishers=$id&${_getKeyParams()}';
  }

  static String gameDetail(int id) {
    return '$_baseApiUrl/games/$id?${_getKeyParams()}';
  }

  static String genres() {
    return '$_baseApiUrl/genres?${_getKeyParams()}';
  }

  static String genresDetail(String id) {
    return '$_baseApiUrl/genres/$id?${_getKeyParams()}';
  }

  static String publishers(int index) {
    return '$_baseApiUrl/publishers?${_getPageIndexParams(index)}&${_getKeyParams()}';
  }

  static String publisherDetail(int id) {
    return '$_baseApiUrl/publishers/$id?${_getKeyParams()}';
  }

  static String stores() {
    return '$_baseApiUrl/tags?${_getKeyParams()}';
  }

  static String storesDetail(String id) {
    return '$_baseApiUrl/stores/$id?${_getKeyParams()}';
  }

  static String creators(int index) {
    return '$_baseApiUrl/creators?${_getPageIndexParams(index)}&${_getKeyParams()}';
  }

  static String creatorDetail(int id) {
    return '$_baseApiUrl/creators/$id?${_getKeyParams()}';
  }
}
