import 'package:dio/dio.dart';
import 'package:news_app/Models/NewsArticle.dart';
import 'package:news_app/Utils/Constants.dart';

class ApiServices {
  var dio = Dio();

  Future<List<NewsArticle>> fetchAllNews() async {
    final response = await dio.get(Constants.Main_News);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result[Constants.Articles];
      print(
          'ApiService1: ${list.map((article) => NewsArticle.fromJson(article)).toList()}');
      // return response.data.;
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get news");
    }
  }

  Future<List<NewsArticle>> fetchByCategoryAndCountry(
      String country, String category) async {
    final response = await dio
        .get(
            '${Constants.End_Point}category=$category&country=$country&apiKey=${Constants.Api_Key}')
        .catchError((e) {
      print('ApiService3: ${e.toString()}');
    });
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result[Constants.Articles];
      print(
          'ApiServices3: ${Constants.End_Point}country=$country&category=$category&apiKey=${Constants.Api_Key}');
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }

  Future<List<NewsArticle>> fetchByCategory(String category) async {
    try {
      final response = await dio
          .get(
              '${Constants.End_Point}country=eg&category=$category&apiKey=${Constants.Api_Key}')
          .catchError((e) {
        print('ApiService2: ${e.toString()}');
      }).whenComplete(() {
        print('ApiService2: Completed}');
      });

      if (response.statusCode == 200) {
        final result = response.data;
        Iterable list = result[Constants.Articles];
        // print('ApiServices2: ${list.length}');
        print(
            'ApiService2: ${Constants.End_Point}country=eg&category=$category&apiKey=${Constants.Api_Key}');
        return list.map((article) => NewsArticle.fromJson(article)).toList();
      }
    } catch (e) {
      print('ApiServices2: ${e.toString()}');
      throw Exception("failed to get top news");
    }

    // if(response.)
    // print('ApiServices2: ${response.statusMessage}');
    // if (response.statusCode == 200) {
    //   final result = response.data;
    //   Iterable list = result[Constants.Articles];
    //   print('ApiServices2: ${list.length}');
    //   return list.map((article) => NewsArticle.fromJson(article)).toList();
    // } else {
    //   print('ApiServices2: Error}');
    //   throw Exception("failed to get top news");
    // }
  }
}
