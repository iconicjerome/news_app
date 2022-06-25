import 'dart:convert';
import 'package:news_app/models/api_models2.dart';

import 'package:http/http.dart' as http;

class EntService {
  //initialze function to get data from API of type List(Future)

  Future<List<GetNews>> getNews() async {
    var uri = Uri.http('newsapi.org', '/v2/top-headlines',
        {"country": "us", "category": "entertainment"});

    final response = await http
        .get(uri, headers: {"X-Api-Key": "7cfdd9bbae574c2a8875783830e00fb0"});

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['articles']) {
      temp.add(i);
    }

    return GetNews.getnewsFromSnapshot(temp);
  }
}
