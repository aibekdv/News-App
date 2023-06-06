import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/models/models.dart';

class FetchData {
  Dio dio = Dio(BaseOptions(
    contentType: 'application/json',
  ));

  Future<NewsModel?> getAllNews({String country = 'us'}) async {
    String apiKey = '93ddf10e190949448ca35614f33760d1';
    String apiLink =
        'https://newsapi.org/v2/top-headlines?country=$country&sortBy=popularity&apiKey=$apiKey';

    Response res = await dio.get(apiLink);

    if (res.statusCode == 200 || res.statusCode == 201) {
      return NewsModel.fromJson(jsonDecode(jsonEncode(res.data)));
    }
    return null;
  }
}
