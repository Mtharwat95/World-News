import 'package:flutter/cupertino.dart';
import 'package:news_app/Models/NewsArticle.dart';
import 'package:news_app/Services/ApiServices.dart';
import 'package:news_app/Utils/Constants.dart';
import 'package:news_app/ViewModels/NewsVM.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoadingStatus { completed, searching, empty }

class NewsListVm with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsVM> articles = List<NewsVM>();

  void fetchAll() async {
    List<NewsArticle> newsArticles = await ApiServices().fetchAllNews();
    this.articles =
        newsArticles.map((article) => NewsVM(article: article)).toList();
    this.loadingStatus = LoadingStatus.completed;
    notifyListeners();
    if (this.articles.isEmpty) {
      print('NewsListVmf: empty');
      this.loadingStatus = LoadingStatus.empty;
      notifyListeners();
    } else {
      print('NewsListVmf: complete');
      this.loadingStatus = LoadingStatus.completed;
      notifyListeners();
    }
    notifyListeners();
  }

  void fetchByCategory(String category) async {
    print('NewsListVm: ');
    notifyListeners();
    List<NewsArticle> newsArticles =
        await ApiServices().fetchByCategory(category);
    this.articles =
        newsArticles.map((article) => NewsVM(article: article)).toList();
    loadingStatus = LoadingStatus.completed;
    notifyListeners();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
      print('NewsListVm: Empty');
      notifyListeners();
    } else {
      print('NewsListVm: Completed');
      this.loadingStatus = LoadingStatus.completed;
      notifyListeners();
    }
    notifyListeners();
  }

  void fetchByCategoryAndCountry(String category, String country) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await ApiServices().fetchByCategoryAndCountry(country, category);
    this.articles =
        newsArticles.map((article) => NewsVM(article: article)).toList();
    notifyListeners();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  Future<String> defaultCountry() async {
    String value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString(Constants.DefaultCountry) == null) {
      // this.currentCountry = 'us';
      preferences.setString(Constants.DefaultCountry, 'us');
      print('Tharwat0: ${preferences.getString(Constants.DefaultCountry)}');
      value = 'US';
      notifyListeners();
      return value;
    } else {
      print('Tharwat1: ${preferences.getString(Constants.DefaultCountry)}');
      value = preferences.getString(Constants.DefaultCountry);
      notifyListeners();
      return value;
    }
  }
}
