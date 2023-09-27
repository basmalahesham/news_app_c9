import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static const String apiKey = "fa8b144e12144c6d9ebdb47010053bf5";
  static const String baseUrl = "https://newsapi.org";

  // domain              /endPoint               ? query parameters
  // https://newsapi.org/v2/top-headlines/sources?apiKey=fa8b144e12144c6d9ebdb47010053bf5&category=sports

  Future<SourceModel> fetchSources(String category) async {
    // query parameters
    var query = {"apiKey": apiKey, "category": category};
    final response = await http.get(
      Uri.http(
        baseUrl, // domain
        '/v2/top-headlines/sources', // endPoint
        query, // query parameters
      ),
    );

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return SourceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sources');
    }
  }
}
